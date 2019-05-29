#!/bin/bash

#
# Global variables
#
export REGISTRY=docker-registry.ossim.io
export REGISTRY_URL=http://$REGISTRY
export INTERNAL_REGISTRY="docker-registry.default.svc:5000"
ES_CLUSTER_MEM_SIZE="512m"
ES_CLUSTER_MIN_MASTER_NODES=4
ES_CLUSTER_STORAGE_SIZE="10Gi"
ES_CLUSTER_REPLICAS=6
STORAGE_CLASS_NAME="gp2"
KIBANA_REPLICAS=2
PROJECT_NAMESPACE="es-stack"
KIBANA_IMAGE="$INTERNAL_REGISTRY/$PROJECT_NAMESPACE/kibana-app"
ES_IMAGE="$INTERNAL_REGISTRY/$PROJECT_NAMESPACE/es-app"

# default password will be admin
#
ES_ADMIN_PASSWORD=admin
ES_ADMIN_PASSWORD_HASH='$2y$12$CDBVfeo3DKox1ctmbwqIW.RVZxm9IQHov5t92aBKpobeB8g3F1Fjq'

if [ "$SCRIPT_DIR" == "" ] ; then
  pushd `dirname ${BASH_SOURCE[0]}` >/dev/null
  SCRIPT_DIR=`pwd -P`
  popd >/dev/null
fi
export TEMPLATE_DIR="${SCRIPT_DIR}/template/"

function loadfile {
  local  fileString=$(<$1)

  echo "$fileString"
}

function isroot {
  if [[ $EUID -ne 0 ]] ; then
    false
  else
    true
  fi
}

function mustRunAsRoot {
  if ! isroot ; then 
   echo "Must run as root to install."
   echo "Try running with sudo ${*}"
   exit 1
  fi
}

if ! isroot; then
  SUDO=sudo
else
  SUDO=
fi
