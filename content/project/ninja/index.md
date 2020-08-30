---
title: Ninja, 24 Elim Solo
subtitle: Mapping how Ninja destroys the entire lobby.
summary: Visualization of one of Ninja's Fortnite runs
tags:
- data_project
date: "2019-09-05T00:00:00Z"

image:
  placement: 1
  focal_point: Smart
  preview_only: true

links:
- icon: external-link-alt
  icon_pack: fas
  name: Viz (PDF)
  url: ninja-fortnite-yt-viz.pdf
---

This is a visualization of one of [Ninja](https://en.wikipedia.org/wiki/Ninja_(streamer))'s Fortnite runs. I plotted his eliminations with a game map overlay and connected them with smooth curves, creating an approximate movement path you can follow from start to finish. Accented with audio blurb annotations, you can get a good sense of his progression through the run.

I've wanted to do something with [Fortnite](https://en.wikipedia.org/wiki/Fortnite) for a while now, so this serves as a toe in the water. This was a manual creation, but it has got me thinking how it would be lovely to auto-generate these kinds of plots for streamers in the future. Someday.

{{< figure src="ninja-fortnite-yt-viz.png" title="Progression of one of Ninja's Fornite runs" lightbox="true" >}}

## Visualization Notes

The yellow dots represent the approximate locations of the eliminated players. The locations were found by watching Ninja's YouTube video, "[Ninja Destroys The Entire Lobby!! 24 Elim Solo](https://youtu.be/2m4pQYAIGL4)", and taking screenshots when eliminations were made. The mini map in each screenshot was then used to place a point on the visualization.

The light blue path is created by drawing a line between the twenty-four yellow elimination points and applying smooth curves. Because of this, the light blue path is only an approximation of Ninja's movements and is taking liberties at certain spots, particularly with sniper eliminations. For example, the top-most yellow dot in the visualization is far from the preceding elims, implying Ninja walked over to that player to get the elimination. In actuality, Ninj[a sniped that player from far away](https://youtu.be/2m4pQYAIGL4?t=587) rather than going up a large mountain to attack at close range. It would be interesting in the future to try a more accurate recreation of player movement, but I think this approximation tells a compelling story.

The dotted-line portion of the path approximates the initial descent from the bus. The video does not include the bus's transit path, so it is omitted (it would have made things a little crowded, anyway).

The blue dots signify when Ninja started using a mech and when he transitioned into a new mech (where "mech" is the [B.R.U.T.E. vehicle](https://gamewith.net/fortnite/article/show/10401)). Not all eliminations after those points were made in mechs. For example, up at Salty Springs, he [exits the mech](https://youtu.be/2m4pQYAIGL4?t=555) to acquire four eliminations before [reentering](https://youtu.be/2m4pQYAIGL4?t=600) to cover more ground. In general, it would be interesting to further explore how the type of elimination could be better displayed without overloading the viewer (color by weapon used, use of vehicle, etc.).

The annotations were taken from Ninja's stream audio after the elimination occurred. They are lightly edited.

The dark blue squiggly line defines the border of the southwest corner of the game map. Initially I was going to include the entire outline of the map, but it served no purpose. The location names are placed where they appear on the game map. This causes some overlap of paths, points, and text (particularly at Salty Springs and Fatal Fields), but the intention was to go for accuracy with regards to the game map placement.

The text was typeset in Arial; apologies, type-lovers.

The color palette was chosen to compliment [Ninja's logo identity](https://www.youtube.com/channel/UCAW-NpUFkMyCNrvRSSGIvDQ) as of September 2019.

###  Fortnite Context

This run's landing site was Pandora, a [crossover event with Borderlands](https://www.epicgames.com/fortnite/en-US/news/mayhem-comes-to-fortnite) (termed "Mayhem" in-game). This limited-time rift zone gave players regenerative shields.

This run was recorded shortly after [changes were made to the turbo build feature](https://www.epicgames.com/fortnite/en-US/patch-notes/v10-20-patch-notes), which were later [reverted](https://www.epicgames.com/fortnite/en-US/news/turbo-build-delay-update). More info on changes to the game can be found in the [Fortnite patch notes](https://www.epicgames.com/fortnite/en-US/news).
