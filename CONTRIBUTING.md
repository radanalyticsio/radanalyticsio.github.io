# Contributing to the radanalytics.io

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

## Adding a new application

If you would like to propose a new application for inclusion in the tutorials
section, there are a couple steps that need to be completed:

1. Copy the `_templates/example_application.md` file to the `_applications`
   directory, and rename it to suite your application's name.
2. Edit your new application markdown file with the appropriate information.
   (there is information in the example on what to provide)
3. Create a directory for your application documentation assets in the
   `assets` directory. This new directory should be named to match the value
   you provided in the `link` variable front matter in your application
   document.
4. Add any assets you will need (graphics, files, etc) to your assets
   directory.
5. Copy the `_templates/lightning` directory into your assets directory. This
   directory contains the [reveal.js](https://github.com/hakimel/reveal.js)
   slide deck template.
6. Edit the `index.html` file for the lightning slide deck. (there is
   information in the file on what to provide)
7. Commit the files to your feature branch and propose a pull request when
   you are ready.

### A note on front matter

Files that will be processed by jekyll contain a bit at the beginning referred
to as [front matter](https://jekyllrb.com/docs/frontmatter/). This is a small
section of YAML that contains variables which will be available to the
processing engine. When creating your application documentation there are
several front matter variables which will help with the proper display of
your information. Please be careful to follow the instructions in the template
about their usage.
