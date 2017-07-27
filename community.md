---
layout: markdown
title: Community
menu_entry: Community
---

# Development

The radanalytics.io community has several ongoing projects with frequent
releases. These are all collected in our GitHub organization. Each project
addresses a specific concern within the OpenShift realm and provide solid
solutions for your own data driven applications.

<h4>
<a href="https://github.com/radanalyticsio" target="blank">
<i class="fa fa-github fa-lg" aria-hidden="true"></i> GitHub Organization
</a>
</h4>

# Presentations

The following presentations are about the technologies involved in, or
related to the radanalytics.io projects. We love our community and the
passion they have for this technology, if you have a presentation, or know of
one that would fit in here, please open a
[pull request](https://github.com/radanalyticsio/radanalyticsio.github.io/pulls)
and add it to the list!

<!-- to add presentatations, see the _data/presentations.yaml file -->

{% assign sorted_presentations = site.presentations | sort: 'date' | reverse %}
{% for pres in sorted_presentations %}
## {{ pres.title }}
*{{ pres.presentor }}*

{{ pres.content }}

<a href="{{ pres.media-url }}">
<i class="fa fa-video-camera" aria-hidden="true"></i>
&nbsp; Presentation media</a>

{% if pres.slides-url %}
<a href="{{ pres.slides-url }}">
<i class="fa fa-picture-o" aria-hiddent="true"></i>
&nbsp; Slide deck</a>
{% endif %}

{% endfor %}
