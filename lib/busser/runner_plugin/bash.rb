#
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
#
# Copyright (C) 2013, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "busser/runner_plugin"

# A Busser runner plugin for Bash.
#
# @author Fletcher Nichol <fnichol@nichol.ca>
#
class Busser::RunnerPlugin::Bash < Busser::RunnerPlugin::Base

  # Only files matching this are executed. Anything else in the suite directory
  # -- helper scripts, fixtures, a README -- is deliberately left alone, so a
  # suite can keep shared setup next to its tests.
  TEST_FILE_GLOB = "*_{test,spec}.{sh,bash}".freeze

  # Selects the scripts to run out of a suite directory.
  #
  # Kept as a module function taking an explicit path so the selection rule can
  # be tested without a Busser root on disk.
  #
  # @param path [String, Pathname] the suite directory to search
  # @return [Array<String>] matching script paths, sorted for a stable run order
  def self.test_files_in(path)
    Dir.glob(File.join(path.to_s, TEST_FILE_GLOB)).sort
  end

  # Runs each bash script in the suite, in turn. A script's exit code is the
  # verdict, so the first failure aborts the run.
  #
  # @return [void]
  def test
    self.class.test_files_in(suite_path("bash")).each do |file|
      banner "[bash] #{File.basename(file)}"
      run!("bash #{file}")
    end
  end
end
