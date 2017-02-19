---
layout: markdown
menu_entry: Get Started
---




## 1. [Setup OpenShift](https://www.openshift.org/#try)

For instance, download the [oc command](https://github.com/openshift/origin/releases) and run

```bash
oc cluster up
```
[![asciicast](https://asciinema.org/a/5dktnu7lmo6qutaqt73m07nhv.png){: width="671px"}](https://asciinema.org/a/5dktnu7lmo6qutaqt73m07nhv)



## 2. Install and setup Oshinko

Oshinko is a set of technologies that integrate [Apache Spark](https://spark.apache.org/) with [OpenShift](https://www.openshift.org/). The two projects we need are [oshinko-s2i (source-to-image)](https://github.com/radanalyticsio/oshinko-s2i) and [oshinko-webui (a web UI that runs in a pod on OpenShift)](https://github.com/radanalyticsio/oshinko-webui). The Oshinko S2I images need to be authorized to build and manage the Apache Spark cluster on your behalf, so we will create a `ServiceAccount` with `edit` permissions.

```bash
: Create and authorize the ServiceAccount for Oshinko to create clusters
oc create serviceaccount oshinko
oc policy add-role-to-user edit -z oshinko

: Install the Oshinko S2I python template
oc create -f https://raw.githubusercontent.com/radanalyticsio/oshinko-s2i/master/pyspark/pysparkbuilddc.json

: Launch the Oshinko Web UI
oc new-app https://raw.githubusercontent.com/radanalyticsio/oshinko-webui/master/tools/ui-template.yaml
```

At this point you can go to your [OpenShift Console](https://docs.openshift.com/container-platform/latest/architecture/infrastructure_components/web_console.html), at [https://localhost:8443/](https://localhost:8443/) if you used `oc cluster up`, and explore the Oshinko Web UI.

#### OpenShift Console

![OpenShift Console](/img/openshift-cluster-with-oshinko-webui.png)

#### Oshinko Web UI

![Oshinko Web UI](/img/fresh-oshinko-webui.png)


## 3. Head over to the [tutorial applications](/tutorials)
