---
layout: post
title:  "Revisiting Projection"
tags: [Plotter, Projection, 3D]
---

After briefly exploring projection [before](/2019/07/10/projection-plotting.html), I sought to see what else I could make with the tools I had at hand. First I changed my original <a href="https://glitch.com/~projection1" target="_blank">projection1</a> sketch to move the camera and the boxes so that it was staring into the middle of the group.

<figure>
  <img src="/assets/images/revisiting-projection/projection3.svg">
  <figcaption>
    <a href="https://glitch.com/~projection3" target="_blank">projection3</a>
  </figcaption>
</figure>

Then stumbling around Bandcamp I came across this album whose artwork piqued my interest. I figured I could use my projection code to make something similar.

<iframe style="border: 0; width: 296px; height: 296px; display: block; margin-left: auto; margin-right: auto;" src="https://bandcamp.com/EmbeddedPlayer/album=943239778/size=large/bgcol=ffffff/linkcol=0687f5/minimal=true/transparent=true/" seamless><a href="http://emotional-rescue.bandcamp.com/album/jumpcut">Jumpcut by Man Jumping</a></iframe>

I wrote out some rudimentary code to hide the vertical edges of cubes and arranged them in rows that fade back toward the horizon. Immediately some strange bugs in my placement or projection code reared it's head. The results were very captivating, though.

<figure>
  <img src="/assets/images/revisiting-projection/projection4-1.svg">
  <figcaption>projection4-1</figcaption>
</figure>

Soon after fiddling with the placement code I managed to get something more resembling the target image. At this point however I had abandoned the idea of trying to recreate the original image exactly and was sufficiently hooked into seeing what I could make with this new field of squares.

### Experiments

<figure>
  <img src="/assets/images/revisiting-projection/projection4-2.svg">
  <figcaption>projection4-2</figcaption>
</figure>

What if we rendered a few of the vertical lines that connect the top and bottom faces of these cubes?

<figure>
  <img src="/assets/images/revisiting-projection/projection4-3.svg">
  <figcaption><a href="https://glitch.com/~projection-4" target="_blank">projection4-3</a></figcaption>
</figure>

What if there were square panels for as far as the eye could see?

<figure>
  <img src="/assets/images/revisiting-projection/projection4-4.png">
  <figcaption>projection4-4</figcaption>
</figure>

