#!/bin/bash

# Must have sbt assembly and terraform

./copy_zip_to_build_stacks.sh \
&& (cd deltalake-processing && docker run -it --rm -v sbt_ivy_data:/root/.ivy2 -v sbt_data:/root/.sbt -v $PWD:/app -w /app mozilla/sbt sbt assembly) \
&& ./copy_jars_to_lambda-emr-run-deltalake.sh \
&& (cd infra && make) \
&& echo "Build All DONE."