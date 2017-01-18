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

All instructions about installation and deployment can be found to the related project link.
