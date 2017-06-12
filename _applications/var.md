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
- https://github.com/willb/var-notebook
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
[Jupyter](http://jupyter.org/) notebook. This notebook connects to a Spark
cluster and schedules jobs to perform simulations.

<h1 id="installation">Installation</h1>

Installing the value-at-risk notebook is straightforward; you simply need to
create an OpenShift project, deploy a Spark cluster in that project, and
install and run the notebook image.

## Prerequisites

The easiest way to get a Spark cluster going in your OpenShift project is to
use [`oshinko-deploy.sh`][odsh]. This provides a streamlined installation for
the Oshinko cluster manager into your project. Oshinko is a service to manage
Spark clusters for OpenShift projects.

[odsh]: https://github.com/radanalyticsio/oshinko-webui/blob/master/tools/oshinko-deploy.sh

We'll need to use a special Spark worker image for this application. This
worker image has a small amount of historical stock return data stored in its
filesystem. For a real application, you'd want to get data from persistent
storage, from a database, or from an object store service. For a demo, though,
it's much easier to package up a small amount of data where each worker can get
it.

In order to get this special Spark worker image, we'll use the `-s` flag to
`oshinko-deploy.sh`:

`oshinko-deploy.sh -s willb/var-spark-worker`

## Setting up a cluster

From the OpenShift developer console, visit the Oshinko web interface. Use the
interface to create a new cluster, and take note of what you've called this
cluster. The rest of this documentation will assume that your cluster is named
`sparky`, and so your master URL is `spark://sparky:7077`.

## Adding the notebook application

The next step is to add the notebook application. From the OpenShift developer
console, select "Add to Project" and then "Deploy Image." We'll be deploying an
image with a particular name, so select "Image Name" and then enter
`willb/var-notebook:var35`.

Once the `var-notebook` service is visible within the developer console, select
"Create Route" and create a public route to the `var-notebook` service,
targeting port 8888. The public route you create will depend on your DNS
configuration, but you can use the [xip.io
service](https://access.redhat.com/solutions/2141701) for development and
testing.

<h1 id="usage">Launching and Using the Notebook</h1>

Verify that the `var-notebook` service is running and that your Spark cluster
is running by looking at the developer console. Once each is up and functional,
you can use the notebook by visiting the route you defined earlier in your
browser.

Interacting with the Jupyter notebook is very simple. Select a cell with Python
code and execute it by pressing the "run cell" button in the toolbar. Before
you get started, you'll need to make sure you're able to connect to your Spark
cluster: in the very first code cell, find the line that looks like this:

`spark = SparkSession.builder.master("spark://sparky:7077").getOrCreate()`

and replace `sparky` with whatever name you chose for your Spark cluster.

You can edit the code in the notebook cells and re-run them, and results from
cells you've already run will be available to new cells. The notebook interface
provides a great way to experiment with new techniques. Try it out!

<h1 id="expansion">Extending the application</h1>

There are lots of ways to extend this application.  Here are a few suggestions:

1. Using the Seaborn library's `distplot` function and models from SciPy, find
a distribution that is a better fit for the stock returns data.
2. Use this distribution to fit models to each ticker symbol and develop a new
simulate method to sample from these distributions rather than from normal
distributions. Compare the results of this simulation to the results of the
simulation 
3. ★ Implement a goodness-of-fit test of your choice. 
4. ★ Identify some additional distributions to use for modeling security
returns that don't work well with the distribution you identified above. Build
a more sophisticated simulation that chooses one of several possible
distributions for each security to find the best fit.

<h1 id="videos">Videos</h1>

You can see a demo of installing and running the notebook application in the
following video:

<iframe src="https://player.vimeo.com/video/194528216" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<p><a href="https://vimeo.com/194528216">Value-at-risk notebook demo in OpenShift</a>.</p>
