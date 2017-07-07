---
title: Ceph Source Example
link: ceph-source-example
weight: 100
labels:
- Python
- Ceph
- S3
- Jupyter
layout: application
menu_template: menu_tutorial_application.html
description: |-
  This is an example of how to connect your application to data in Ceph using S3 API.
project_links:
- https://github.com/rimolive/ceph-spark-integration
---
<h1 id="introduction">Introduction</h1>

Processing data stored in an external object store is a practical and
popular way for an intelligent application to operate.

This is an example of the key pieces needed to connect your
application to data in Ceph using S3 API. It is presented as steps in a Jupyter
notebook. To run this example, you need a Ceph environment running in your network.
Optionally, you can run in your own computer using ```vagrant``` and ```ansible```
(check .

[Ceph Source Example](https://github.com/radanalyticsio/radanalyticsio.github.io/blob/master/assets/ceph-source-example/ceph-example.ipynb)
[Ceph Ansible playbooks](https://github.com/ceph/ceph-ansible)

<h1 id="get-started">Get started</h1>

In case you need to configure your own Ceph environment, follow the
steps below:

* Clone [ceph-ansible](https://github.com/ceph/ceph-ansible) GitHub repo.
* Rename ```vagrant_variables.yml.sample``` to ```vagrant_variables.yml```
  and edit the file by changing to the following snippet:

~~~
...
# DEFINE THE NUMBER OF VMS TO RUN
mon_vms: 1
osd_vms: 3
mds_vms: 0
rgw_vms: 1
...
~~~

* Rename also ```site.yml.sample``` to ```site.yml```.
* Run ```vagrant up``` inside the repo.

<h1 id="architecture">Architecture</h1>

No architecture, this is a connectivity example.

<h1 id="installation">Installation</h1>

* Start a Jupyter notebook with the commands:

~~~
oc new-app rimolive/notebook
oc expose svc/notebook
~~~

* Find the connection url using the following command:

~~~
oc logs dc/workshop | grep localhost | sed "s/localhost:8888/$(oc get routes/workshop --template='{{.spec.host}}')/"
~~~

* Download [the notebook](https://github.com/radanalyticsio/radanalyticsio.github.io/blob/master/assets/ceph-source-example/ceph-example.ipynb), upload into jupyter and follow the notebook instructions.

<h1 id="usage">Usage</h1>

No specific usage.

<h1 id="expansion">Expansion</h1>

No specific expansion.

<h1 id="videos">Videos</h1>

No video, follow the notebook steps.