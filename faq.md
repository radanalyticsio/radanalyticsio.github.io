---
layout: markdown
menu_entry: FAQ
---

# Frequently Asked Questions


## How do I connect to a cluster to debug / develop?

```bash
oc run -it --rm dev-shell --image=radanalyticsio/openshift-spark --command -- bash

: Setup nss_wrapper rapper to avoid exceptions from Hadoop about failure to login.
cat /etc/passwd > /tmp/passwd
echo "$(id -u):x:$(id -u):$(id -g):dynamic uid:$SPARK_HOME:/bin/false" >> /tmp/passwd
export NSS_WRAPPER_PASSWD=/tmp/passwd
export NSS_WRAPPER_GROUP=/etc/group
export LD_PRELOAD=libnss_wrapper.so

: Go to a directory where you can write to ./ (useful when using Spark SQL to avoid 'Directory /metastore_db cannot be created.')
cd /tmp

: Run a shell...
spark-shell
```


## How do I connect to Apache Kafka?

You need to add **--packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.1.0** when running *spark-shell*, *spark-submit* or to *SPARK_OPTIONS* for S2I, e.g. *oc new-app --template=oshinko-pyspark-build-dc -p GIT_URI=[your source repo] -e SPARK_OPTIONS='--packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.1.0'*
