---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "{{ replace .Name "-" " " | title }}"
subtitle: "TODO"
tags: []
categories: []
date: {{ .Date }}

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
# projects: []

# Koji Button
# YAML language example from https://yaml.org/spec/1.2/spec.html#id2772075
# The trick: have to nake the link something like "koji_button" to put it inside a group
links:
  koji_button:
    icon: mug-hot
    icon_pack: fas
    name: Give a Coffee
    url: https://ko-fi.com/zachbogart
---
