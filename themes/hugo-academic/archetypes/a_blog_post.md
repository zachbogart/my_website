---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "{{ replace .Name "-" " " | title }}"
subtitle: "TODO"
summary: "TODO"
tags: []
categories: []
date: {{ .Date }}

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: yes

# Output and Chunk Output in Console
output: html_document
editor_options: 
  chunk_output_type: console

# Koji Button
# YAML language example from https://yaml.org/spec/1.2/spec.html#id2772075
# The trick: have to nake the link something like "named_button" to put it inside a group
links:
  donate_button:
    icon: seedling
    icon_pack: fas
    name: Ways to Support
    url: /support/
---

<!-- Icon Image: Small -->
<img src="featured.png" width="100"/> 

<!--Starting Blurb-->
TODO

<!--Put actual work here-->
TODO
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, 
                      cache.lazy = FALSE,
                      fig.width = 8,
                      fig.height = 5,
                      message = FALSE)
```


<!--Section on Learning (general notes that came up)-->
## Learning
TODO

<!--Noun Image Credit-->
#### Image Credit
[TODO](TODO) by Zach Bogart from [the Noun Project](https://thenounproject.com/)
