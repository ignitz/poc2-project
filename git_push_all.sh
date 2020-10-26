#!/bin/bash

(cd datafeeder && git push) \
&& (cd kafka-stack && git push) \
&& (cd deltalake-processing && git push) \
&& (cd infra && git push) \
&& echo "Git push DONE."
