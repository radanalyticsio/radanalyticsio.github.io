---
title: Example Application
link: example_application
weight: 100
labels:
- Language
layout: application
menu_template: menu_tutorial_application.html
menu_items: lightning
description: |-
  Put your description here, this text will be rendered on the "Tutorials"
  page under your application's title.
project_links:
- https://github.com/example/example-application
---

<h1 id="introduction">Introduction</h1>

Add an introduction about your application here, what it does, what the
user will expect, and any other general high level information. For examples
of other applications, see the `_applications` directory. All the sections
of this document that are delineated with `<h1>` blocks are the mandatory
sections. Please do not edit them as out as the page framework depends on
the internal links.

The front matter of this file is important for displaying information on
the site. The most important variables to fill out while creating your
documentation are: `title`, `link`, `description` and `project_links`.

* `title` is the displayed name that will be used primarily on the tutorials
  page, it is acceptable to have spaces in this
* `link` is the name that will be used internally when generating the site,
  it has meaning for the directory structure and links that will be created,
  it should be a single continuous word with no spaces (underscores and
  hyphens are acceptable)
* `description` is the text that will be used on the tutorials page to
  describe your application
* `project_links` is an array of links that will be displayed on the tutorials
  page with your application, add any links to your source material here
* `menu_items` is an array that aids in the construction of the menu links
  on the application page. The current options are: `lightning`.
* `labels` is an array of strings that describe the primary technologies in
  use within the application (eg Python, ActiveMQ, S3).

If you need to add graphics or other assets to your application page, please
make a directory under the top level `assets` directory. This new directory
should have the same name that you supplied in the front matter `link`
variable. You may reference your assets as follows:

```
<img src="/assets/example_application/my_image.png">
```

Assets may be used in your slide decks as well, using the same link
references.

<h1 id="architecture">Architecture</h1>

In this section talk about how the application is structured, what
technologies does it use, when deployed to the cloud how many components
should the user expect to encounter. Any information along these lines is
helpful.

<h1 id="installation">Installation</h1>

How will the user install this application, these should be detailed
step-by-step instructions.

<h1 id="usage">Usage</h1>

Once installed and running, what is the intended usage of this application.
How will the user interact with it, and what results should they expect.

<h1 id="expansion">Expansion</h1>

How could this application be expanded, are there some exercises that a user
could perform to learn more about this application. This section should be
used to pose open ended questions to the reader and inspire them to add more
functionality.

<h1 id="videos">Videos</h1>

Embed any videos here, you may use full HTML to have the videos displayed on
this page. For example, Vimeo provides an embeddable iframe code for their
videos, this content is acceptable here.
