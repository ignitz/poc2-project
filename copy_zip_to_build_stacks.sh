#!/bin/bash

zip -r datafeeder.zip datafeeder/ && zip -r kafka-stack.zip kafka-stack/ && \
mv -v datafeeder.zip infra/modules/build_stacks/build/ && \
mv -v kafka-stack.zip infra/modules/build_stacks/build/ && \
echo "Done"