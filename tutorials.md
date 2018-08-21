---
layout: markdown
title: Tutorials
menu_entry: Tutorials
---

# Tutorials

These tutorials have been designed to showcase technologies and design
patterns that can be used to begin creating intelligent applications on
OpenShift. We have split them into two broad categories: examples and
applications.

[Applications](#applications) are fully integrated packages which illustrate
how an idea, methodology or technology can be developed and deployed on
OpenShift in a manner that users can experience the underlying analytics in
a more convenient manner.

[Examples](#examples) are small code samples or notebook workflows that
demonstrate how you can integrate a specific technology or technique into
your projects. They are separated from the concept of fitting into a user
experience and speak to architects, developers and technologists.

All of these tutorials contain instructions for installation and usage as
well as open source code artifacts that you are welcome to clone and use
in your own projects and presentations. Some of these tutorials also contain
videos and slide decks that can be helpful when presenting or demonstrating
them to your peers and colleagues.

<h1 id="applications">Applications</h1>

{% assign sorted_applications = site.applications | sort: 'weight' %}
{% for item in sorted_applications %}
<h2>
<a href="/applications/{{ item.link }}">{{ item.title }}</a>
</h2>
<h4>
{% for label in item.labels %}
<span class="badge">{{ label }}</span>
{% endfor %}
</h4>

<p>
{{ item.description }}
</p>

{% if item.project_links %}
#### Project Links

<ul>
{% for link in item.project_links %}
<li><a href="{{ link }}" target="blank">{{ link }}</a></li>
{% endfor %}
</ul>
<br/>
{% endif %}

{% endfor %}

<h1 id="examples">Examples</h1>

{% assign sorted_examples = site.examples | sort: 'weight' %}
{% for item in sorted_examples %}
<h2>
<a href="/examples/{{ item.link }}">{{ item.title }}</a>
</h2>
<h4>
{% for label in item.labels %}
<span class="badge">{{ label }}</span>
{% endfor %}
</h4>

<p>
{{ item.description }}
</p>

{% if item.project_links %}
#### Project Links

<ul>
{% for link in item.project_links %}
<li><a href="{{ link }}" target="blank">{{ link }}</a></li>
{% endfor %}
</ul>
{% endif %}
<br/>
{% endfor %}
