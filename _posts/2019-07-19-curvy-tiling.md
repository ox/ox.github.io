---
layout: post
title:  "Curvy Tiling"
tags: [Plotter, Generative]
---

I'm still relatively new to truly generative art and I love browsing other people's work and trying to recreate it (like my [Sol LeWitt clone](/2019/07/19/sol-lewitt.html)). It's a great exercise to begin thinking of how to break down a piece of work into small, reproducible pieces, and getting into the mindset of thinking about how small local effects can create large, complex pieces.

I was browsing around #plottertwitter when I stumbled across this gorgeous illustration by Logan Willmott. It's immensely captivating and intricate. There doesn't seem to be much rhyme or reason about how the curves decide to move, and arranging all of those lines seems like a nightmare.

<blockquote class="twitter-tweet"><p lang="pt" dir="ltr">Regularly irregular <a href="https://twitter.com/hashtag/plottertwitter?src=hash&amp;ref_src=twsrc%5Etfw">#plottertwitter</a> <a href="https://t.co/PCOShqZwRV">pic.twitter.com/PCOShqZwRV</a></p>&mdash; Logan Willmott (@__lw) <a href="https://twitter.com/__lw/status/1147667383391117312?ref_src=twsrc%5Etfw">July 7, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

## Breaking it down

After staring at the work for a few minutes I started to notice that all of the centers of the swirls were evenly spaced; tiled. There were also no straight segments. Each curve tile either turned left or right in it's space between four centers. I was thinking maybe there was some kind of random walker that started somewhere and just walked randomly left or right relative to the previous block's center. This still seemed fairly involved and I couldn't tell how the next randomly placed walker start point would fit with the existing path.

I started looking at each tile and realized that four different kinds of tiles were used repeatedly across the image. Each tile had a dominant curve that followed one corner of the tile, while a weaker curve underneath it followed the opposite corner.

<div class="image-group--row">
  <img src="/assets/images/curvy-tiling/top-left.png">
  <img src="/assets/images/curvy-tiling/top-right.png">
  <img src="/assets/images/curvy-tiling/bottom-right.png">
  <img src="/assets/images/curvy-tiling/bottom-left.png">
</div>

Notice that any of the pieces can tessellate with the others, thus we can create an even grid of random tiles and are guaranteed to have them fit together into a coherent image.

<figure>
  <img src="/assets/images/curvy-tiling/rendering.png">
  <figcaption>
    <a href="https://glitch.com/~tiling-1" target="_blank">tiling-1</a>
  </figcaption>
</figure>

It's important to try to divide the grid evenly across the rendering so that the edges of the tiles line up with the edges of the image. Logan even [notes](https://twitter.com/__lw/status/1147916923079802880) that he creates a 2mm bleed (empty space) with crop point and trims the paper after the lines are drawn to create the even edge-to-edge effect.

### Calculating tile curves

My initial prototype of drawing the dominant curve involved looping from N degrees to N + PI/2 (quarter of a circle) from the various corners of the tile. I divide the size of the tile by some variable that controls the desired number of lines to use per curve to get the spacing between each line.

```js
const curveDensity = 7;
const radiusChange = this.size / curveDensity;
for (let r = 0; r < this.size; r += radiusChange) {
  beginShape();
  // 0.06 is an arbitrarily small number to increment
  // the degress to progress at each step.
  for (let i = start; i < start + PI / 2; i += 0.06) {
    const x = dominantCorner.x + r * cos(i);
    const y = dominantCorner.y + r * sin(i);
    vertex(x, y);
  }
  endShape();
}
```

To draw the curve "underneath" the dominant curve from the opposite corner requires a similar technique. However, we must check that we are not drawing past the furthest line in the dominant curve. So before a point is added to the underside curve we must check if it's distance is less than the size of the tile.

There is some book-keeping that needs to be done to make sure that you call `endShape()` when the point cannot be drawn, and calling `beginShape()` when the underside curve starts "peeking out" from the dominant curve. If you don't keep your shapes clean then the lines of the underside curve will look very blocky.

### Future optimizations

When plotting the paths, the plotter will stop at each tile edge and may continue on to a completely different curve. This is because each tile calls `beginShape()` and `endShape()` for each individual line that it draws, and so all of the curves are segmented. This leads to visible notches in the curves between adjacent tiles which give away the grid shape.

A better solution would be to just keep track of the points comprising of each line and joining them with the points of the neighboring tiles that create a continuous line.

## Further experimentation

My Glitch project has a few variables that control the density of the grid (`gridSize`), the density of the curves (`curveDensity`), and the minimum distance points on the weaker curve must be from the dominant corner (`exclusionDistance`). Tweaking these results to their extremes leads to some interesting results.

<img src="/assets/images/curvy-tiling/rendering-tiling-1.svg">

<img src="/assets/images/curvy-tiling/rendering-tiling-2.svg">

<img src="/assets/images/curvy-tiling/rendering-tiling-3.svg">

<img src="/assets/images/curvy-tiling/rendering-tiling-4.svg">
