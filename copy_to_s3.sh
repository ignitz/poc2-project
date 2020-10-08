#!/bin/bash

zip -r datafeeder.zip datafeeder/ && zip -r kafka-stack.zip kafka-stack/ && \
aws s3 cp datafeeder.zip s3://yuriniitsuma/build/ && \
aws s3 cp kafka-stack.zip s3://yuriniitsuma/build/ && \
rm datafeeder.zip kafka-stack.zip