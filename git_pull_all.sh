#!/bin/bash

(cd datafeeder && git pull) \
&& (cd kafka-stack && git pull) \
&& (cd deltalake-processing && git pull) \
&& (cd infra && git pull) \
&& echo "Git pull DONE."
