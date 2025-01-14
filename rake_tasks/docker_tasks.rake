# frozen_string_literal: true

# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.
#
# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
require 'mkmf'

namespace :docker do
  desc <<~DOC
    Start OpenSearch in a Docker container.

    Default:
      rake docker:start[version]
    E.g.:
      rake docker:start[1.0.0]

  DOC
  task :start, [:version,:suite] do |_, params|
    abort 'Docker not installed' unless find_executable 'docker'
    abort 'You need to set a version, e.g. rake docker:start[1.0.0]' unless params[:version]

    test_suite = 'free'
    system("STACK_VERSION=#{params[:version]} TEST_SUITE=#{test_suite} ./.ci/run-opensearch.sh")
  end
end
