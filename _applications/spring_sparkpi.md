---
title: Spring Boot SparkPi
link: spring_sparkpi
weight: 100
labels:
- Java
- S2I
layout: application
menu_template: menu_tutorial_application.html
menu_items: lightning
description: |-
  This source-to-image Java application combines the Apache Spark Pi
  estimation example with the popular Spring Boot framework. It provides an
  HTTP microservice which will calculate the value of Pi on demand.
project_links:
- https://github.com/radanalyticsio/spring-sparkpi
---

<h1 id="introduction">Introduction</h1>

The spring-sparkpi application provides an example of how to combine the
power of Apache Spark with the flexibility of the
[Spring Boot framework](https://spring.io/) to create an HTTP microservice
that will deliver an approximation of [Pi](https://en.wikipedia.org/wiki/Pi)
on request. The core of the processing for this application is based directly
on the
[Java Pi Estimation example](https://spark.apache.org/examples.html)
([source](https://github.com/apache/spark/blob/master/examples/src/main/java/org/apache/spark/examples/JavaSparkPi.java))
from the upstream Apache Spark project.

<h1 id="architecture">Architecture</h1>

This application's architecture is quite straighforward. The source code
repository is constructed to build a
[source-to-image](https://github.com/openshift/source-to-image)
deployment for OpenShift. Once built, OpenShift will deploy the driver
application pod and then it will automatically deploy an Apache Spark cluster
of one master pod and one worker pod. Finally, the driver and the cluster pods
will be connected, at which point the service will be ready for access.

<h1 id="installation">Installation</h1>

Installation of this application is quite simple using the `oc` command line
tool. Once you are logged in to your OpenShift project, follow these
instructions:


1. Follow the [Get Started](/get-started) guide to ensure that you are
   connected to an OpenShift project with Oshinko installed

1. Launch spring-sparkpi

   ```bash
   oc new-app --template oshinko-java-spark-build-dc \
       -p APPLICATION_NAME=spring-sparkpi \
       -p GIT_URI=https://github.com/radanalyticsio/spring-sparkpi \
       -p APP_FILE=SparkPiBoot-0.0.1-SNAPSHOT.jar
   ```

1. Expose an external route

   ```bash
   oc expose svc/spring-sparkpi
   ```

<h1 id="usage">Usage</h1>

With the route exposed to your service, you can now begin making queries to
approximate the value of Pi. This can be done with a web browser or other
tool capable of reading HTTP, such as `curl`.

**For example**

```bash
curl http://`oc get routes/spring-sparkpi --template='{% raw %}{{.spec.host}}{% endraw %}'`
Pi is rouuuughly 3.1335
```

<h1 id="expansion">Expansion</h1>

The algorithm to estimate Pi that is used in this application is based on the
idea of
[summing a circle's area](https://en.wikipedia.org/wiki/Approximations_of_%CF%80#Summing_a_circle.27s_area).
The way the code is written, it only uses two hundred thousand sample points.
To push the workload to the limits and create a more valuable microservice
a query parameter could be added to the URL, giving a user the ability to
specify the number of samples to use. By increasing this number you will not
only get a more accurate estimation, but also do some live performance
testing of how your cluster reacts to various workloads.

<h1 id="videos">Videos</h1>

<h2>Spring-SparkPi deployment and usage</h2>

<iframe src="https://player.vimeo.com/video/213863636?title=0&byline=0&portrait=0" width="800" height="425" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
