# Contributing to radanalytics.io

In general, all contributions should be made by forking this repository,
making your changes on a feature branch, and proposing that feature branch
as a pull request in GitHub.

This site is generated using the [Jekyll framework](https://jekyllrb.com),
with several customizations to create the look and feel. Please reference
their documentation for questions about the usage of jekyll features in your
documents.

## Testing out your changes locally

To test this site locally, you will need to have Ruby installed as well as the
[Bundler](https://bundler.io) gem. This will make installing and
running the site much simpler. Provided that you have Ruby and the `gem`
command installed, a quickstart to running the site will be:

```
$ gem install bundler
$ cd radanalyticsio.github.io
$ bundle exec jekyll serve
```

At this point the site will be running and served locally at
`http://localhost:4000`, with the server running any file changes will be
automatically picked up and the site re-generated.

**A note on Mac OSX development**
A common source of problems for Mac users when installing Jekyll's
dependencies is the [Nokogiri library](http://www.nokogiri.org). Should your
`bundle install` run into trouble installing Nokogiri, please see the
[suggestions offered in the Nokogiri docs](http://www.nokogiri.org/tutorials/installing_nokogiri.html#mac_os_x)
or consult [Stack Overflow](https://stackoverflow.com) for other possible
fixes.

### Docker based testing

If you would prefer to use a self-contained environment for testing your
changes, a Dockerfile is provided in the root of the project which will
allow you to leverage the convenience of docker. To test your changes using
this methodology run the following:

```
$ cd radanalytics.github.io
$ chmod go+rX -R .
$ docker build -t radanalytics.io .
$ docker run --rm -it -p 4000:4000 radanalytics.io
```

The site will now be served locally at `http://localhost:4000`

## Adding a new application

If you would like to propose a new application for inclusion in the tutorials
section, there are a couple steps that need to be completed:

1. Copy the `_templates/example_application.adoc` file to the `_applications`
   directory, and rename it to suite your application's name.
2. Edit your new application AsciiDoc file with the appropriate information.
   (there is information in the example on what to provide)
3. Create a directory for your application documentation assets in the
   `assets` directory. This new directory should be named to match the value
   you provided in the `page-link` attribute entry in your application
   document.
4. Add any assets you will need (graphics, files, etc) to your assets
   directory.
5. If your application includes a lightning talk, copy the
   `_templates/lightning` directory into your assets directory. This
   directory contains the [reveal.js](https://github.com/hakimel/reveal.js)
   slide deck template. Also ensure that the `page-menu_items` attribute entry
   contains the `lightning` value, this will create the proper menu link for
   the slide deck.
6. Edit the `index.html` file for the lightning slide deck. (there is
   information in the file on what to provide)
7. Commit the files to your feature branch and propose a pull request when
   you are ready.

## Adding a new FAQ entry

The Frequently Asked Questions (FAQ) page is generated from the collection of
documents stored in the `_faqs` directory. To add a new question/answer pair,
simply do the following:

1. Copy the `_templates/example_faq.adoc` file to the `_faqs` directory, and
   rename it to suite reflect your question.
1. Edit the contents of the new file to contain your question, the title of
   the document will get converted to be used in the FAQ page.
1. Commit the new file to your feature branch and propose a pull request when
   you are ready.

## Adding a new presentation

The community page contains a list of presentations given by and about
radanalytics related topics. If you would like to add your presentation to
this list, please follow these instructions:

1. Copy the `_templates/example_presentation.adoc` file to the
   `_presentations` directory and rename it to reflect the name of your
   presentation.
1. Edit the contents of the new file to contain your presentation abstract
   and related information.
1. Commit the new file to your feature branch and propose a pull request
   when you are ready.

## Adding a new project

The projects page contains a list of the radanalytics hosted projects. If
you would like to add a new project to this list, please follow these
instructions:

1. Copy the `_templates/example_project.adoc` file to the
   `_projects` directory and rename it to reflect the name of the project.
1. Edit the contents of the new file to contain the project information and
   links.
1. Commit the new file to your feature branch and propose a pull request
   when you are ready.

### A note on front matter

Files that will be processed by jekyll contain a bit at the beginning referred
to as [front matter](https://jekyllrb.com/docs/frontmatter/). This is a small
section of YAML that contains variables which will be available to the
processing engine. When creating your application documentation there are
several front matter variables which will help with the proper display of
your information. Please be careful to follow the instructions in the template
about their usage.

### A note on AsciiDoc AttributeEntry blocks

As the content of this repository is converted from Markdown to AsciiDoc, you
might notice some changes in the way the front matter variables are handled.
AsciiDoc documents may contain [AttributeEntry blocks](http://asciidoc.org/asciidoc.css-embedded.html#X18)
in their headers. These variables are used in a similar manner as the Jekyll
front matter variables. Although these attribute entries and front matter can
co-exist within the current deployment framework, the preference should be to
always use AsciiDoc attribute entries when possible.
