---
title: Set up a Elgato Stream Deck for Ubuntu 20.04
date: 2022-11-24 00:03:00 -0500
categories: [Side Project, Battlestation]
tags: [stream deck]     # TAG names should always be lowercase
img_path: /assets/figures/2022-images/
---

Many thanks to my friend Aaron, I now have a stream deck on my desk. 
Since there is no official software for Linux systems, I used [streamdeck_ui](https://timothycrosley.github.io/streamdeck-ui/) which is compatible with Linux to setup the deck.

Specs:
- Stream Deck Model: 20GAA9901
- OS: Ubuntu 20.04

I followed the [installation manual](https://github.com/timothycrosley/streamdeck-ui/) steps and there was no issue with ubuntu 20.04. Even though I am using GNOME shell, I didn't have to install the `KStatusNotifierItem/AppIndicator Support` as suggested, the tray icon just showed up fine.

After setting up the deck, I included the streamdeck to autostart as suggested so it doesn't always take a place in the terminal, basically just go to `Startup Application Preferences` -> `Add` -> Command `streamdeck -n`. The argument `-n` is to not show the configure window when start.

#### Some useful commands:

Open google calendar (or any other page) in google chrome
```bash
google-chrome https://calendar.google.com/
```
Open incognito page in chrome (wink*
```bash
google-chrome --args --incognito "https://www.google.com"
```
Lock screen
```bash
gnome-screensaver-command -l
```
Turn off the laptop
```bash
poweroff
```

#### My setup:
![stream-deck-setup1](2022-11-24-set-stream-deck-ubuntu01.jpg)

I think everyone has their preferred settings. My first page has my to-do list and google calendar,
with a turn-off button and lock screen. Most importantly, four headshots from my favorite C-pop girl group.
What kswl means? if you know, you know.

![stream-deck-setup2](2022-11-24-set-stream-deck-ubuntu02.jpg)

My second page is for entertainment. It only has buttons for youtube, Netflix, and bilibili by now. Just couldn't bother to type those addresses.