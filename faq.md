---
layout: markdown
menu_entry: FAQ
---

# Frequently Asked Questions


## How do I connect to a cluster to debug / develop?

```bash
oc run -it --rm dev-shell --image=radanalyticsio/openshift-spark -- spark-shell
```


## How do I connect to Apache Kafka?

You need to add `--packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.1.0`
when running `spark-shell`, `spark-submit` or to `SPARK_OPTIONS` for S2I. For
example, to start a new application with these options you could run the
following:

```
$ oc new-app --template=oshinko-pyspark-build-dc -p GIT_URI=[your source repo] -e SPARK_OPTIONS='--packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.1.0'
```


## Why am I getting java.io.IOException: failure to login from org.apache.hadoop.security.UserGroupInformation.loginUserFromSubject ?

The underlying Apache Spark code uses Apache Hadoop code to lookup the current user name, which fails. It fails because containers in OpenShift run as an ephemeral uid for security purposes, and that uid does not show up in /etc/passwd. To address this, we have a custom entrypoint for [openshift-spark](https://hub.docker.com/r/radanalyticsio/openshift-spark/) containers that uses [nss_wrapper](https://cwrap.org/nss_wrapper.html) to add the ephemeral uid to /etc/passwd before running any code. However, we cannot provide coverage for all the ways that code can be run. Specifically, `oc rsh` or `oc exec` will avoid our setup code. If you are using either of those, please use `/entrypoint <your command>`.
