#!/usr/bin/env bash

# Copies oc binary out of official openshift origin image
# Note:  this expects the OPENSHIFT_VERSION env variable to be set.
function download_openshift() {
  echo "Downloading oc binary for OPENSHIFT_VERSION=${OPENSHIFT_VERSION}"
  sudo docker cp $(docker create docker.io/openshift/origin:$OPENSHIFT_VERSION):/bin/oc /usr/local/bin/oc
  oc version
}

function setup_insecure_registry() {
# add insecure-registry and restart docker
 sudo cat /etc/default/docker
 sudo service docker stop
 sudo sed -i -e 's/sock/sock --insecure-registry 172.30.0.0\/16/' /etc/default/docker
 sudo cat /etc/default/docker
 sudo service docker start
 sudo service docker status
}

function start_and_verify_openshift() {
  # Sometimes oc cluster up fails with a permission error and works when the test is relaunched.
  # See if a retry within the same test works
  set +e
  built=false
  ip addr show eth0
  export HOST_IP_ADDRESS="$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)"
  echo "Host IP is $HOST_IP_ADDRESS"
  sudo docker cp $(docker create docker.io/openshift/origin:$OPENSHIFT_VERSION):/bin/oc /usr/local/bin/oc
  while true; do
      oc cluster up --public-hostname=$HOST_IP_ADDRESS
      oc login -u system:admin
      export REGISTRY_URL=$(oc get svc -n default docker-registry -o jsonpath='{.spec.clusterIP}:{.spec.ports[0].port}')
      oc login -u developer -p developer
      if [ "$?" -eq 0 ]; then
          ./travis-helpers/travis-check-pods.sh
          if [ "$?" -eq 0 ]; then
              built=true
              break
          fi
      fi
      echo "Retrying oc cluster up after failure"
      oc cluster down
      sleep 5
  done
  set -e
  if [ "$built" == false ]; then
      exit 1
  fi
  # travis-check-pods.sh left us in the default project
  oc project myproject
}

function show_openshift_info () {
  sudo chmod -R a+rwX /home/travis/.kube
  IPSTR=`sudo oc status |grep server`
  echo $IPSTR
  IP=${IPSTR##*/}
  echo ${IP}
  IPSTR=`sudo oc login -u system:admin`
  echo $IPSTR
}

setup_insecure_registry
download_openshift
start_and_verify_openshift
show_openshift_info
