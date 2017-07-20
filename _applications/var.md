---
title: Value-at-risk notebook
link: var
weight: 1
labels:
- Python
- Jupyter
layout: application
menu_template: menu_tutorial_application.html
menu_items: lightning
description: |-
 The value-at-risk notebook is a simple example of how to run Jupyter notebooks on OpenShift, Monte Carlo simulations in Spark, and how to interactively explore data to find better ways to model it.
project_links:
- https://github.com/radanalyticsio/workshop-notebook
---

<h1 id="introduction">Introduction</h1>

This application characterizes historical returns of stock data and then
simulates many possible outcomes for a given portfolio over a given time
horizon. The idea is that you can characterize the value at risk for a given
percentage of simulated outcomes (e.g., "there is a 5% chance we'd lose more
than $1M USD in the next two weeks"). While you wouldn't want to use the
techniques in this application to guide real investment decisions, it also
demonstrates how to use a Jupyter notebook with Apache Spark in OpenShift and
you can modify the basic simulation to model security returns in a more
sophisticated manner.

<h1 id="architecture">Architecture</h1>

The driver for the value-at-risk application is a
[Jupyter](http://jupyter.org/) notebook. A Jupyter notebook is an interactive
compute environment that interleaves documentation, code examples, and
graphical output. This particular notebook uses Spark to orchestrate
simulations of the stock market.

We'll use the notebook the way a data scientist might for initial
experimentation, with a single Spark executor embedded within the application.
Running a notebook on OpenShift provides a lot of advantages even if we aren't
using scale-out compute:

1. if we have a project accessible from a public cloud, we can work on it from
anywhere, with any device;
2. we can easily share our work with colleagues; and
3. our results will be easily reproducible, since repeatable deployments mean they
won't depend on any details of our environment.

<h1 id="installation">Install and run the notebook</h1>

Installing our notebook is very simple:  we just need to create an OpenShift project and install and run the notebook application.  Make sure you're logged in to OpenShift and have selected the right project, and then execute the following two commands:

`oc new-app radanalyticsio/workshop-notebook -e JUPYTER_NOTEBOOK_PASSWORD=developer`

`oc expose svc/workshop-notebook`

Check the OpenShift web console.  Once the notebook application is running, click on its route.  Jupyter will ask you to log in; use `developer` for a password (or the password you specified if you used a different one when you ran `oc new-app`).  You'll be presented with a list of notebooks that are installed in the workshop-notebook image.  The one we're interested in is `var.ipynb`, so click on it.  (There are some other files in this image:  `pyspark.ipynb` is an introduction to Apache Spark and `ml-basics.ipynb` introduces some basic machine learning techniques.)

Interacting with the Jupyter notebook is very simple. Select a cell with Python
code and then execute it, either by pressing the "run cell" button in the
toolbar or by pressing shift + enter. You can edit the code in the notebook
cells and re-run them, and results from cells you've already run will be
available to new cells. The notebook interface provides a great way to
experiment with new techniques. Try it out!

Once you've worked through the whole notebook, consider trying out the
self-guided exercises at the end of the notebook. If you want to run your own
Jupyter notebooks in OpenShift, consider extending the
[base-notebook](https://github.com/radanalyticsio/base-notebook) image.

<h1 id="videos">Videos</h1>

You can see a demo of installing and running the notebook application in the
following video:

<iframe src="https://player.vimeo.com/video/194528216" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<p><a href="https://vimeo.com/194528216">Value-at-risk notebook demo in OpenShift</a>.</p>

