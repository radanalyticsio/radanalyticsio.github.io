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
notebook. To run this example, you need a Ceph environment running in your network
and a running Spark cluster in your OpenShift project.
Optionally, you can run in your own computer using ```vagrant``` and ```ansible```
(check [Pre-requisites](#pre-requisites) section if you need to deploy a local 
instance of Ceph).

[Ceph Source Example](https://github.com/radanalyticsio/radanalyticsio.github.io/blob/master/assets/ceph-source-example/ceph-example.ipynb)
[Ceph Ansible playbooks](https://github.com/ceph/ceph-ansible)

<h1 id="prerequisites">Prerequisites</h1>

In case you need to configure your own Ceph environment, follow the
steps below:

1. Clone [ceph-ansible](https://github.com/ceph/ceph-ansible) GitHub repo.
2. Rename ```vagrant_variables.yml.sample``` to ```vagrant_variables.yml```
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

3. Rename also ```site.yml.sample``` to ```site.yml```.
4. Run ```vagrant up``` inside the repo.
5. Follow the [getting started](/get-started) instructions to create an OpenShift project with the Oshinko web interface running.

<h1 id="architecture">Architecture</h1>

No architecture, this is a connectivity example.

<h1 id="installation">Installation</h1>

1. From the OpenShift developer console, visit the Oshinko web interface. Use the 
   interface to create a new cluster, and take note of what you’ve called this cluster.

2. Start a Jupyter notebook with the commands:
   ~~~
   oc new-app rimolive/notebook
   oc expose svc/notebook
   ~~~

3. Find the connection url using the following command:
   ~~~
   oc logs dc/pyspark-hdfs-notebook | grep localhost | sed "s/localhost:8888/$(oc get routes/pyspark-hdfs-notebook --template='{% raw %}{{.spec.host}}{% endraw %}')/"
   ~~~

4. Download [the notebook](/assets/ceph-source-example/ceph-example.ipynb), upload into jupyter and follow the notebook instructions. Make sure in the line where the notebook connects to the spark cluster you changed with the cluster name you used in step 1 and in the line where you set up the Ceph connection you change with the IP where you Ceph instance is running.

<h1 id="usage">Usage</h1>

No specific usage.

<h1 id="expansion">Expansion</h1>

No specific expansion.

<h1 id="videos">Videos</h1>

No video, follow the notebook steps.