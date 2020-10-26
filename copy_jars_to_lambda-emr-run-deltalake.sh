#!/bin/bash

mkdir -p infra/modules/lambdas/emr-run-deltalake/build/dev \
    && mkdir -p infra/modules/lambdas/emr-run-deltalake/build/prd \
    && mkdir -p infra/modules/lambdas/emr-run-deltalake/build/hml \
    && cp -v deltalake-processing/target/scala-2.12/deltalake-processing-assembly-1.0.jar \
       infra/modules/lambdas/emr-run-deltalake/build/deltalake-processing-assembly-1.0.jar \
    && echo "Copying jars done."
