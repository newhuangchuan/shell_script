#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHART_DIR="${SCRIPT_DIR}/../../deploy/eck-operator"
CRD_CHART_DIR="${CHART_DIR}/charts/eck-operator-crds"
EFFECTIVE_SRC_CHART_DIR=${CHART_DIR}
echo ${SCRIPT_DIR}
echo ${CHART_DIR}
echo ${CRD_CHART_DIR}
echo ${EFFECTIVE_SRC_CHART_DIR}


while getopts 'abcd' OPT; do
    case $OPT in
        a)
            echo $2
            ;;
        b)
            echo $2
            ;;
        c)
            echo $3
            ;;
        d)
            echo $1
            ;;
        *)
            exit 1
            ;;
     esac
done
