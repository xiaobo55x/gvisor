#!/bin/bash

# Copyright 2018 The gVisor Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

source $(dirname $0)/common.sh

# Build runsc.
build //runsc

# Build packages.
build --host_force_python=py2 //runsc:debian

# Move the runsc binary into "latest" directory, and also a directory with the
# current date. In the future, we will support automatically labelling
# directories if we happen to be building a tag (for actual releases).
if [[ -v KOKORO_ARTIFACTS_DIR ]]; then
  latest_dir="${KOKORO_ARTIFACTS_DIR}"/latest
  today_dir="${KOKORO_ARTIFACTS_DIR}"/"$(date -Idate)"
  mkdir -p "${latest_dir}" "${today_dir}"
  cp $(path //runsc) "${latest_dir}"
  sha512sum "${latest_dir}"/runsc | awk '{print $1 "  runsc"}' > "${latest_dir}"/runsc.sha512
  cp $(path //runsc) "${today_dir}"
  sha512sum "${today_dir}"/runsc | awk '{print $1 "  runsc"}' > "${today_dir}"/runsc.sha512
fi
