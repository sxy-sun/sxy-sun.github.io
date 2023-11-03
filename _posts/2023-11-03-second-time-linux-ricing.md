---
title: Second Time Linux Ricing
date: 2023-11-03 00:07:00 -0400
categories: [Project]
tags: [ubuntu] 
img_path: /assets/figures/2023-images/2023-11-03-second-time-linux-ricing
---

Venturing into Linux ricing [with i3](/posts/first-time-linux-ricing/) was an eye-opener. While I appreciated its potential, those key bindings were a handful. So, in this post, I'm exploring a different path in Linux ricing, adding just a touch of flair. It's about giving Ubuntu a little charm, not necessarily amping up productivity.

### Showcase
![](terminal2.png){: width="600"}

It's not much, but it's as stable as I like it.

### GTK Theme "Nordic"
For the overall desktop color theme, I am using [Nordic](https://github.com/EliverLara/Nordic).

### GNOME Terminal color theme
![](terminal.png){: width="400"}

The color themes are downloaded from [Gogh](https://gogh-co.github.io/Gogh/). I have Tokyo Night, Tokyo Night Storm, and Tomorrow Night Blue. I think these three suit well with my noridc theme.


### GNOME Extentions
- [Blur my Shell](https://github.com/aunetx/blur-my-shell): I only use this to turn my top bar transparent
- [Just Perfection](https://gitlab.gnome.org/jrahmatzadeh/just-perfection): I use this to modify the top bar
- [Rounded Window Corners](https://github.com/yilozt/rounded-window-corners): It not only can make your window looks rounded, but also add shadow around the edges
- [Vitals](https://github.com/corecoding/Vitals): It is a top bar status monitor monitoring temp, fan speed, CPU Load, etc
- Other built-in extensions comes with GNOME 42

**How to use the zip file downloaded from [gnome extension website](https://extensions.gnome.org/)**

1. Ensure you have the `gnome-shell-extensions` package installed.
    ```bash
    sudo apt install gnome-shell-extensions
    ```
2. Unzip the zip file and looking for a file named `metadata.json`. Open this file to find a line that reads `"uuid": "some-name@domain.com"`. The value of uuid is the proper name you should rename the extension folder to.
3. Move the folder to `~/.local/share/gnome-shell/extensions` and you will find your other gnome extensions are all sitting in there. 
4. Log out and log back in to restart GNOME Shell.
5. Now you can use the `Extention` app to enable/disable extentions.