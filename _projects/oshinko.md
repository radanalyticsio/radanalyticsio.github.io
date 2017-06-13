---
title: Oshinko
labels:
- Infrastructure
---

Oshinko is a top level namespace that covers several individual projects
which are focused on delivering Apache Spark clusters inside OpenShift. The
individual repositories, labelled `oshinko-*`, provide differing levels of
interaction with an OpenShift deployment.

The individual components of Oshinko are:

<a href="https://github.com/radanalyticsio/oshinko-cli" target="blank">
<i class="fa fa-github fa-lg" aria-hidden="true"></i> oshinko-cli
</a>
the cli repository contains a command line tool for managing clusters, it
also contains a Go language library encompassing the business logic of
managing clusters, and a REST server which uses that library

<a href="https://github.com/radanalyticsio/oshinko-console" target="blank">
<i class="fa fa-github fa-lg" aria-hidden="true"></i> oshinko-console
</a>
an extension to the OpenShift console which enables integrated support for
managing clusters

<a href="https://github.com/radanalyticsio/oshinko-s2i" target="blank">
<i class="fa fa-github fa-lg" aria-hidden="true"></i> oshinko-s2i
</a>
source-to-image tooling for creating Spark applications with the ability to
deploy transient per-application clusters

<a href="https://github.com/radanalyticsio/oshinko-specs" target="blank">
<i class="fa fa-github fa-lg" aria-hidden="true"></i> oshinko-specs
</a>
documents containing feature proposals for implementation in the Oshinko
namespace

<a href="https://github.com/radanalyticsio/oshinko-webui" target="blank">
<i class="fa fa-github fa-lg" aria-hidden="true"></i> oshinko-webui
</a>
an HTML server which provides a container based browser interface for cluster
management
