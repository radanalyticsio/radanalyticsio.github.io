---
title: Graf Zahl
link: grafzahl
layout: application
menu_template: menu_tutorial_application.html
description: |-
  Graf Zahl is a demonstration application using Spark's Structured
  Streaming feature to read data from an Apache Kafka topic. It
  presents a web UI to view the top-k words found on the topic.
project_links:
- https://github.com/mattf/grafzahl
- https://github.com/mattf/word-fountain
- https://github.com/mattf/openshift-kafka
---

<h1 id="introduction">Introduction</h1>

This is intended to be an example of how an application can process
data from Apache Kafka with Apache Spark on OpenShift.

Graf Zahl will count, as he does, the words on an Apache Kafka topic
and display the top-k in a web page for the user. There isn't much
more to him, as you might expect.

<h1 id="architecture">Architecture</h1>

Graf Zahl is composed of a single pod that serves both as a stream
processor as well as web server, using
[Flask](http://flask.pocoo.org/). A production-ready application would
separate the processor from the web UI by an operational data store,
i.e. a database or in-memory data grid.

For Graf Zahl to have anything to do he needs some data to
consume. To help him out here we also provide two other pods.

1. Apache Kafka running entirely in one pod. This is not
   production-ready because it does nothing to provide replication,
   durability or scalability of the topic used by Graf Zahl. What it
   does provide is just enough Kafka to demonstrate stream processing.

2. A source of some data to count. For this we provide a word
   fountain, generating words to the topic that Graf Zahl will
   consume.

<h1 id="installation">Installation</h1>

Installing and deploying Graf Zahl utilizes [Oshinko
S2I](https://github.com/radanalyticsio/oshinko-s2i), specifically the
[Oshinko pyspark](https://hub.docker.com/r/radanalyticsio/radanalytics-pyspark/)
builder. [S2I](https://docs.openshift.com/enterprise/latest/architecture/core_concepts/builds_and_image_streams.html#source-build)
is a technology for taking a source repository that has a specific
layout and building it into a container image that is then deployed
as a pod on OpenShift.

The [word fountain](https://github.com/mattf/word-fountain) component
will also use S2I, but the [default python
builder](https://docs.openshift.com/enterprise/latest/using_images/s2i_images/python.html)
provided by OpenShift, because there is no dependency on Apache Spark.

Apache Kafka is more similar to infrastructure for the other
components and not an application itself, so instead of using S2I, it
is directly deployed from a template and pre-built container images.

First, make sure you are connected to an OpenShift cluster and are in
a project with Oshinko installed. See [Get Started](/get-started) if
you need help.

Second, load the Apache Kafka infrastructure components into your
project and start them.

```
oc create -f https://raw.githubusercontent.com/mattf/openshift-kafka/master/resources.yaml
oc new-app apache-kafka
```

Third, launch the word fountain, so Graf Zahl will have something to
count. The word fountain uses the `SERVERS` environment variable to
find the Apache Kafka deployment to use. In the second step, when you
created `apache-kafka` you created a service with the same name on
port 9092. Note: The first time this step and the next run you'll have
to wait for the builder images to be pulled down from the internet, so
if you're on a thin pipe you may want to start both at the same time
and grab a drink.

```
oc new-app openshift/python-27-centos7~https://github.com/mattf/word-fountain -e SERVERS=apache-kafka:9092
```

Forth, launch Graf Zahl himself, using the Oshinko pyspark S2I
builder.

```
oc new-app --template=oshinko-pyspark-build-dc \
           -p APPLICATION_NAME=grafzahl \
           -p GIT_URI=https://github.com/mattf/grafzahl \
	   -p APP_ARGS=--servers=apache-kafka:9092 \
	   -p SPARK_OPTIONS='--packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.1.0'
```

Finally, expose Graf Zahl's web UI so you can connect to it with a
browser.

```
oc expose svc/grafzahl
```

<h1 id="usage">Usage</h1>

Once installed, running and exposed, navigate to the Graf Zahl web UI via the OpenShift Console.

<h1 id="expansion">Expansion</h1>

You can fork this application as a starting point for your own stream
processing application with Kafka.

<h1 id="videos">Videos</h1>

[![asciicast](https://asciinema.org/a/4y3uc1fmtt341gw44b4vmbrcl.png){: width="671px"}](https://asciinema.org/a/4y3uc1fmtt341gw44b4vmbrcl)
