---
layout: markdown
title: Get Started
menu_entry: Get Started
---

# Overview

The radanalytics.io projects are all focused on increasing your ability to
design, deploy, and maintain insightful data-driven applications. The
foundation of this effort are infrastructure projects which simplify the
process of deploying and managing data processing frameworks.

This introduction will help you learn about the primary radanalytics.io
projects, how to install them, and how to utilize them with your own
applications.

# Which projects should you start with?

Although the [projects](/projects) page contains all the collected efforts of
the radanalytics.io community, there are several applications which deserve to
be highlighted as they are key to beginning your journey here.

## Oshinko

The Oshinko project covers several individual applications which all focus on
the goal of deploying and managing [Apache Spark](https://spark.apache.org)
clusters on [Red Hat OpenShift](https://www.openshift.com) and
[OpenShift Origin](https://www.openshift.org).

With the Oshinko family of applications you can create, scale, and destroy
Apache Spark clusters. These clusters can then be used by your applications
within an OpenShift project by providing a simple connection URL to the
cluster. There are multiple paths to achieving this: browser based graphical
interface, command line tool, and a RESTful server.

To begin your exploration, we recommend starting with the
[oshinko-webui](https://github.com/radanalyticsio/oshinko-webui) application.
The oshinko-webui is a self-contained deployment of the Oshinko technologies.
An OpenShift user can deploy the oshinko-webui container into their project
and then access the server with a web browser. Through the browser interface
you will be able to manage Apache Spark clusters within your project.

Another important part of Oshinko to highlight is the
[oshinko-s2i](https://github.com/radanalyticsio/oshinko-s2i) repository and
associated images which implement the
[source-to-image](https://docs.openshift.org/latest/architecture/core_concepts/builds_and_image_streams.html#source-build) workflow for Apache Spark based applications. These images enable
you to create full applications that can be built, deployed and upgraded
directly from a source repository.

# Quickstart with Oshinko

## 1. Connect to an OpenShift cluster

Download the [oc command](https://github.com/openshift/origin/releases) and login to an existing cluster with `oc login https://...`. Alternatively, [setup your own cluster](https://www.openshift.org/#try) with `oc cluster up` or the
[Minishift](https://www.openshift.org/minishift) tool(Windows and Mac users
may find this option easiest to start).

## 2. Install and setup Oshinko

First, install all the Oshinko resources into your project -

```bash
oc create -f https://radanalytics.io/resources.yaml
```

This creates the latest versions of the Oshinko S2I (source-to-image) templates and the Oshinko Web UI application, as well as a ServiceAccount and RoleBinding needed for creation and management of Apache Spark clusters. Follow [this alternative](#alternative) to use components from a specific Oshinko release.

Second, start the Oshinko Web UI application -

```bash
oc new-app oshinko-webui
```

This creates the Oshinko Web UI, which can be used to manually create and manage Apache Spark clusters.

At this point you can go to your
[OpenShift Console](https://docs.openshift.com/container-platform/latest/architecture/infrastructure_components/web_console.html)
, at [https://localhost:8443/](https://localhost:8443/) if you used
`oc cluster up`, and explore the Oshinko Web UI.

**OpenShift Console**

<img src="/img/get-started-openshift-with-oshinko-webui.png" class="img-responsive screenshot">

**Oshinko Web UI**

<img src="/img/get-started-fresh-oshinko-webui.png" class="img-responsive screenshot">

## 3. Head over to the [tutorial applications](/tutorials)

With Oshinko now installed and running in your OpenShift project, we recommend checking out
the tutorial applications that the radanalytics.io community have created.
These tutorials will you show how to deploy and utilize an insightful
data-driven application with Oshinko and OpenShift.

## 4. <a name="alternative"></a>Alternative commands to run a specific Oshinko release

You can use `resources.yaml` to install Oshinko components from a specific release beginning with v0.2.6.
First set `OSHINKO_VERSION` to the release version, for example:

```bash
OSHINKO_VERSION="v0.2.6"
```

Then run this command to generate and process a modified resources.yaml:

```
wget https://radanalytics.io/resources.yaml -qO - \
| sed -r -e "s@radanalyticsio/radanalytics-.*spark@&:$OSHINKO_VERSION@" \
| sed -r -e "s@radanalyticsio/oshinko-webui@&:$OSHINKO_VERSION@" \
| oc create -f -
```
