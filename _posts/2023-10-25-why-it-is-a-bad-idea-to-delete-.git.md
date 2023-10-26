---
title: Why it is a bad idea to delete .git file
date: 2023-10-26 15:00:00 -0400
categories: [Technotes, Git]
tags: [git] 
---

Yet another lesson learned from work. The scenario was that we had a repository that stored a codebase with the commit history from the very beginning, and now, we wanted to distribute the codebase without the git history to ensure our secrets remained unexposed.

However, I naively thought that if I deleted the `.git` folder, it would remove the history and I can just reinitialize the local codebase with `git init` to the new repository, thereby solving the issue. But no, that's risky and isn't the best approach.

In this article, we're going to discuss why you shouldn't do it that way, and what is the proper way to do it.

### What is .git
`.git` is initialized by `git init`, it contains all information required for version control. Now this sounds like, it would store all the information about the past of the project, but it is more than that.

### What happens if you delete .git carelessly

### How to remove git commits history properly

https://toolsqa.com/git/dot-git-folder/