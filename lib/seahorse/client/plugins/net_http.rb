# Copyright 2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

module Seahorse
  module Client
    module Plugins
      class NetHttp < Plugin

        autoload :Handler, 'seahorse/client/plugins/net_http/handler'
        autoload :ConnectionPool, 'seahorse/client/plugins/net_http/connection_pool'

        ConnectionPool::OPTIONS.each_pair do |opt_name, default_value|
          configure(opt_name, default_value)
        end

        handler(NetHttp::Handler, priority: :send)

      end
    end
  end
end
