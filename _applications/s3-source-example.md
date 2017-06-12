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
oc new-app mattf/workshop:base
oc expose svc/workshop
```

Find the connection url,

```
oc logs dc/workshop | grep localhost | sed "s/localhost:8888/$(oc get routes/workshop --template='{% raw %}{{.spec.host}}{% endraw %}')/"
   http://workshop-project.10.11.12.13.xip.io:8888/?token=bd4b955c45d5e9f573ee719f31e9ed12a7805b4334db93c9
```

Download [the notebook](https://github.com/radanalyticsio/radanalyticsio.github.io/blob/master/assets/s3-source-example/s3-source-example.ipynb) and upload it.

<h1 id="usage">Usage</h1>

No specific usage.

<h1 id="expansion">Expansion</h1>

No specific expansion.

<h1 id="videos">Videos</h1>

No video, follow the notebook steps.
