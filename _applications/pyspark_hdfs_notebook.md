---
title: PySpark HDFS Notebook
link: pyspark_hdfs_notebook
weight: 100
labels:
- Python
- HDFS
- Jupyter
layout: application
menu_template: menu_tutorial_application.html
menu_items: lightning
description: |-
  This is a very simple Jupyter notebook application which runs on OpenShift. It shows how to read a file from a remote HDFS filesystem with PySpark.
project_links:
- https://github.com/tmckayus/pyspark-hdfs-notebook
---

<h1 id="introduction">Introduction</h1>

This application is really a simple "how-to" on reading a file
from HDFS into a Spark application. It reads the file and counts
the number of occurrences of each word in the file (splitting the
words on spaces). Output is limited to 20 lines in case the file
is large.

<h1 id="architecture">Architecture</h1>

The driver for the application is a Jupyter notebook. It will
connect to a Spark cluster, read a file from the HDFS filesystem
on a remote Hadoop cluster, and schedule jobs on the Spark cluster
to count the number of occurrences of words in the file.

<h1 id="installation">Installation</h1>

Installing this notebook is straightforward; you simply need to
create an OpenShift project, deploy a Spark cluster in that project, and
install and run the notebook image.

## Prerequisites

Follow the [getting started](/get-started) instructions
to create an OpenShift project with the Oshinko web interface running.

## Setting up a cluster

From the OpenShift developer console, visit the Oshinko web interface. Use the
interface to create a new cluster, and take note of what you've called this
cluster.

## A Hadoop cluster for input ##

If you don't happen to have a Hadoop cluster set up, you can follow
[these instructions](https://hadoop.apache.org/docs/r2.7.1/hadoop-project-dist/hadoop-common/SingleCluster.html)
to set up a single-node Hadoop cluster to use for input.

## Permissions for the Hadoop input ##

This notebook will run as the user *nbuser* (UID 1011 in the *root* group). Note that this user must
have read access to the HDFS file path that is selected for reading.  Permissions can be set on
the HDFS fileystem from the Hadoop cluster.

Check the documentation at [Apache Hadoop](http://hadoop.apache.org/) for more information on
administering Hadoop.

## Adding the notebook application

The notebook application can be launched from the command line with a few
simple commands:

```
$ oc new-app tmckay/pyspark-hdfs-notebook
$ oc expose svc/pyspark-hdfs-notebook
```

Once the notebook pod is running, you can find the connection URL like this:

```
$ oc logs dc/pyspark-hdfs-notebook | grep localhost | sed "s/localhost:8888/$(oc get routes/pyspark-hdfs-notebook --template='{% raw %}{{.spec.host}}{% endraw %}')/"
   http://pyspark-hdfs-notebook-myproject.10.11.12.13.xip.io:8888/?token=bd4b955c45d5e9f573ee719f31e9ed12a7805b4334db93c9
```

Visiting the URL returned from the above command should log you into the notebook homepage.
You can open the notebook by double clicking on the file *PySpark_HDFS.ipynb*.

<h1 id="usage">Usage</h1>

Interacting with the Jupyter notebook is very simple. If you select a cell
with Python code you can 1) edit it or 2) execute it by pressing the "run cell"
button in the toolbar.

This notebook includes cells with instructions for running the program. Make
sure to modify the value of the Spark master URL in the first code block
(replacing *mycluster* with the name of the cluster you created) and
set the variables *hdfs_hostname*, *hdfs_port*, and *hdfs_path* according
to the instructions.

<h1 id="expansion">Expansion</h1>

The point of this example is to read from an unsecured HDFS. Interesting
expansions would be to write something back to HDFS at another file location
and then add examples for reading and writing using a secured HDFS as well.

<h1 id="videos">Videos</h1>

There is no video for this application at this time
