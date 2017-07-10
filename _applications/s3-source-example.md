---
title: S3 Source Example
link: s3-source-example
weight: 100
labels:
- Python
- S3
- Jupyter
layout: application
menu_template: menu_tutorial_application.html
menu_items: lightning
description: |-
  This is an example of how to connect your application to data in S3.
project_links:
- https://github.com/radanalyticsio/radanalyticsio.github.io/blob/master/assets/s3-source-example
---

<h1 id="introduction">Introduction</h1>

Processing data stored in an external object store is a practical and
popular way for an intelligent application to operate.

This is an example of the key pieces needed to connect your
application to data in S3. It is presented as steps in a Jupyter
notebook.

[S3 Source Example](https://github.com/radanalyticsio/radanalyticsio.github.io/blob/master/assets/s3-source-example/s3-source-example.ipynb)

<h1 id="architecture">Architecture</h1>

No architecture, this is a connectivity example.

<h1 id="installation">Installation</h1>

Start a Jupyter notebook with,

```
oc new-app radanalyticsio/base-notebook \
   -e JUPYTER_NOTEBOOK_PASSWORD=supersecret \
   -e JUPYTER_NOTEBOOK_X_INCLUDE=https://radanalytics.io/assets/s3-source-example/s3-source-example.ipynb
oc expose svc/base-notebook
```

From your OpenShift Console, go to the notebook's web interface and
login with `supersecret`.

<img src="/assets/s3-source-example/console.png" class="img-responsive">

Open the notebook and try out the example code.

<img src="/assets/s3-source-example/jupyter.png" class="img-responsive">

<h1 id="usage">Usage</h1>

No specific usage.

<h1 id="expansion">Expansion</h1>

No specific expansion.

<h1 id="videos">Videos</h1>

No video, follow the notebook steps.
