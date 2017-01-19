---
title: AMQP - Spark Streaming
link: amqpstreaming
layout: application
menu_template: menu_tutorial_application.html
description: |-
  This demo shows how it's possible to integrate AMQP based products with Apache Spark Streaming. It uses the AMQP Spark Streaming connector, which is able to get messages from an AMQP source and pushing them to the Spark engine as micro batches for real time analytics
project_links:
- https://github.com/redhat-iot/amqp-spark-demo
---

<h1 id="introduction">Introduction</h1>

This application shows how it's possible to integrate AMQP based products with Apache Spark Streaming.
It uses the AMQP Spark Streaming connector, which is able to get messages from an AMQP source
and pushing them to the Spark engine as micro batches for real time analytics.
The other main point is that the used Apache Spark deployment isn't in standalone mode
but running on OpenShift. Finally, an Apache Artemis instance is used as
AMQP source/destintation for exchanged messages.

The application consists of a publisher part which simulates temperature values
from a reading sensor and sending them to the `temperature` queue available on the broker via AMQP.
At same time, a Spark driver application uses the AMQP connector for reading the messages
from the above queue and pushing them to the Spark engine.
The driver application shows the max temperature value in the last 5 seconds.

<h1 id="architecture">Architecture</h1>

The scenario for using the AMQP - Spark Streaming connector can be described with following picture.

<img src="/assets/amqpstreaming/connector_scenario.png" class="img-connector scenario">

The main components which defines the architecture of the application are :

* An Apache Spark cluster running on OpenShift
* An Apache Artemis broker instance for the queue used for exchanging messages
* The AMQP - Spark Streaming connector for reading that from the above queue
providing them to the Spark engine for stream processing
* A simple client application which simulates a sensor and sends temperature values
to the queue using the AMQP protocol

<img src="/assets/amqpstreaming/application_scenario.png" class="img-connector scenario">

<h1 id="installation">Installation</h1>

The first step is building the source code from the repository as described at
following [link](https://github.com/redhat-iot/amqp-spark-demo#building-the-demo-source-code).

After that, OpenShift is needed in order to run an Apache Spark as described
[here](https://github.com/redhat-iot/amqp-spark-demo#openshift-cluster-set-up).

Finally, the cluster deployment is made possible using the Oshinko web application as described
at this [link](https://github.com/redhat-iot/amqp-spark-demo#deploying-the-apache-spark-cluster).

<h1 id="usage">Usage</h1>

Running the application is quite simple and it's described in the running section
of the upstream project [here](https://github.com/redhat-iot/amqp-spark-demo#running-demo-applications).

<h1 id="expansion">Expansion</h1>

The user is free to change the application driver in order to apply different
Spark operations for gathering different insights (not only the max value) from
the stream of temperature values.

<h1 id="videos">Videos</h1>

No videos are avialble for this application.
