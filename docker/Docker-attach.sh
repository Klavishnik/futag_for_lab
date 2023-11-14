#!/usr/bin/env bash

docker run -it --rm --privileged --network host -v $(pwd)/../:/home/user/ --name futag_src_ubuntu22 futag_src_ubuntu22 /bin/bash
