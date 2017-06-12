---
layout: markdown
title: Tutorials
menu_entry: Tutorials
---

# Applications

These applications have been designed to showcase different aspects of data
driven development on OpenShift. They cover various topics and all include
complete instructions on architecture, installation, and usage. You will also
find videos and slide decks that you may use to present these applications in
your own settings.

{% assign sorted_applications = site.applications | sort: 'weight' %}
{% for app in sorted_applications %}
<h2>
<a href="/applications/{{ app.link }}">{{ app.title }}</a>
{% for label in app.labels %}
<span class="badge">{{ label }}</span>
{% endfor %}
</h2>

<p>
{{ app.description }}
</p>

#### Project Links

<ul>
{% for link in app.project_links %}
<li><a href="{{ link }}" target="blank">{{ link }}</a></li>
{% endfor %}
</ul>

{% endfor %}
