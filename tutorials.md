---
layout: markdown
menu_template: menu_tutorials.html
---

# Applications

These applications have been designed to showcase different aspects of data
driven development on OpenShift. They cover various topics and all include
complete instructions on architecture, installation, and usage. You will also
find videos and slide decks that you may use to present these applications in
your own settings.

{% for app in site.applications %}
<h2><a href="/applications/{{ app.link }}">{{ app.title }}</a></h2>

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
