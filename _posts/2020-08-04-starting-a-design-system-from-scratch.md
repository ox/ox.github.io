---
layout: post
title:  "Starting a Design System From Scratch"
tags: [Programming, Design System]
unlisted: true
---

A "design system" is a set of decisions and rules that help guide designers to create consistent layouts, web sites, and any other product that the design system covers. A design system can be as small or as large as you want it to be. It can be as simple as picking a single font for copy, or as complex as a portfolio of systems depending on medium and usecase. A design system will grow with you.

Most of what I learned about design systems came from Andrew Couldwell's ["Laying the Foundations"][laying-the-foundations]. It is an excellent resource that covers every aspect of what a design system is for, how to get buy-in for building one, and examples of design systems used by large companies like Uber and IBM. I highly recommend reading it before starting to build your own design system so that you have the best chance of success.

After I read Andrew's book I felt that I had a good idea of what the end product should look like but I was still very intimidated deciding where to start. After months of prodding at my system I figured I should document my steps to help others get started. 

## Goals

My first step was to list out the problems I wanted my design system to solve or at least help:

- A small handful of font families
- [Vertical rhythm][vertical-rhythm]
- Consistent spacing
- Maintaining a color scheme

## Tackling Fonts

Before reading Laying the Foundations I was trying to give myself a crash course on typography and general visual literacy. I was posessed by Tim Brown's ["A More Meaningful Typography"][more-meaningful-typography] and figured modular scales could prove useful in my design system, partly to create a tangible scale but also to ease my anxiety of "doing something wrong." I was also new to configuring font usage rules and had no intuition on what values were acceptable.

Zell's ["Why is Vertical Rhythm an Important Typography Practice?"][vertical-rhythm] post further confirmed that there was something to having multiples of a root value to make everything on a page related and easy to parse. I found a tool called [modularscale] that let me plug in ratios to visualize scales. I settled on the nice "perfect fifth" with a root of 1em (1em is the root `font-size`, which 16px in all browsers).

[laying-the-foundations]: https://designsystemfoundations.com/
[more-meaningful-typography]: https://alistapart.com/article/more-meaningful-typography/
[vertical-rhythm]: https://zellwk.com/blog/why-vertical-rhythms/
[modularscale]: https://www.modularscale.com/?1&em&1.5
