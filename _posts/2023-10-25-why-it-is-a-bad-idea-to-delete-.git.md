---
title: Why It Is a Bad Idea to Delete .git File Directly
date: 2023-10-26 17:00:00 -0400
categories: [Technotes, Git]
tags: [git] 
---

Yet another lesson learned from work. The scenario was that we had a repository that stored a codebase with the commit history from the very beginning, and now, we wanted to distribute the codebase without the git history to ensure our secrets remained unexposed.

However, I naively thought that if I deleted the `.git` folder, it would remove the history and I can just reinitialize the local codebase with `git init` to the new repository, thereby solving the issue. But no, that's risky and isn't the best approach.

In this article, we're going to discuss why you shouldn't delete `.git` carelessly, and what is the proper way to do it.

## What is .git
`.git` is initialized by `git init`, it contains all information required for version control. Now this sounds like, it only store all the information about the past of the project, but it is more than that. The `.git` directory not only maintains the history and structure of the main repository but also handles the storage and management of all its submodules.

## What happens if you delete .git carelessly

### Issue
I aimed to have a repository with the current files but without the commit history. 

After deleting the `.git` folder, everything appeared fine locally. I then commited and pushed to a new remote repository, and on the surface, all seemed well. However, the problem became evident when I pulled from this new remote. A submodule in `/lib/pico-sdk` was missing. In fact, the entire `lib` folder was absent in the new remote repository, something I had initially overlooked.

### Why the folder was gone
Now let's look what I have locally. 

I have an empty directory `/lib/pico-sdk` which will act as a placeholder. Later on, I'll run `git submodule update --init` from the project’s root directory to pull the necessary content into this directory. The path `/lib/pico-sdk` is already specified in the `.gitmodules` file. Everything was in order.

> The `.gitmodules` file specifies the path and URL of a submodule in your repository. This file helps Git know where the submodule's content should appear in your working directory and where to find the submodule's repository online.

```bash
.
├── CMakeLists.txt
├── lib
│   └── pico-sdk
├── src
...and more
```

The first thing I learned: **Git does not track empty directories!**

After deleting the old `.git` folder and initializing a new Git repository, the empty directory was no longer recognized. When I executed `git add -A`, the `/lib` directory wasn't added to the staging area. That's when I had lost the placeholder path `/lib/pico-sdk`. It is still on my local machine, but it never made it to the remote site.

Simply running `mkdir -p lib/pico-sdk` will restore the directory after pulling new repository from remote, but pulling the submodule still didn't work.

> At this point, it doesn't even matter if I had the path. The path is already defined in `.gitmodules`, and the command `git submodule update --init` will create it if it doesn't already exist.
{: .prompt-tip }

### Where did the submodule go
Supposedly, when I execute this command, I should see the following output and the submodule content should be downloaded. However, after deleting the `.git` folder, there was no output at all.
```bash
$ git submodule update --init
Submodule path 'lib/pico-sdk': checked out 'some SHA string here'
```

The second thing I learned: **`.git` stores the pointer to the submodules!**

If you run `git log`, you will see each of your commit has one unique identifier in the form of SHA. `.git` not only stores your commits, but also has your submodules' SHA, as a kind of reference, or say pointer. So the main repository doesn't have to store the content of the submodule. That's why when you do a fresh clone of a repository with submodules, you often have to run `git submodule update --init` to actually pull the content of the submodules.

If you want to see the current commit SHA of a submodule, you can navigate to the root of your repository and use:

```bash
git ls-tree HEAD path/to/submodule
```
- The SHA points to a specific commit in the submodule repository, ensuring that anyone cloning your repository gets the exact version of the submodule that you've specified, even if new commits are added to the submodule's repository later.

In essence, by deleting the `.git` directory, I lost the connection/reference to the submodule.

## How to remove git commits history properly

If you want to start a new branch in a Git repository without any commit history, the `--orphan` flag is your choice. 

```bash
git checkout --orphan new_branch
```
To test if the history is indeed gone:
```bash
git log
```
you'll get an error since there are no commits.

You've now cleared your commit history, but the files and folders from your project remain intact. To Git, it appears as if you've freshly added everything. All the files and directories from the previous branch are staged, awaiting commitment to this new orphan branch.

To commit the entire project, simply use `git commit -a,` and this will be the first ever commit in current branch.

You can now link to a new remote and push current branch there, have a complete copy without the old history, without worring about losing submodules.

```bash
git remote add new_remote <new_remote_url>
```
Check if the remote is added
```bash
git remote -v
```
Push to new remote:
```bash
git push new_remote new_branch
```