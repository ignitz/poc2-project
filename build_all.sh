#!/bin/bash

# Must have sbt assembly and terraform

./copy_zip_to_build_stacks.sh \
&& (cd deltalake-processing && sbt assembly) \
&& ./copy_jars_to_lambda-emr-run-deltalake.sh
&& (cd infra && make) \
&& echo "Build All DONE."