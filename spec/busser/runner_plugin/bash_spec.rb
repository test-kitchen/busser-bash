require_relative "../../spec_helper"

require "tmpdir"
require "busser/runner_plugin/bash"

describe Busser::RunnerPlugin::Bash do
  # Which files the plugin picks up is the plugin's entire contract with a
  # suite author, and it is documented in the README. These cover the rule
  # rather than the implementation, so the glob can be rewritten freely.
  describe ".test_files_in" do
    def selecting(*names)
      Dir.mktmpdir do |dir|
        names.each { |n| File.write(File.join(dir, n), "") }
        yield Busser::RunnerPlugin::Bash.test_files_in(dir).map { |f| File.basename(f) }
      end
    end

    it "takes _test and _spec scripts with either extension" do
      selecting("a_test.sh", "b_test.bash", "c_spec.sh", "d_spec.bash") do |found|
        _(found).must_equal %w{a_test.sh b_test.bash c_spec.sh d_spec.bash}
      end
    end

    it "leaves helper scripts alone" do
      selecting("helper.sh", "spec_helper.sh", "setup.bash", "a_test.sh") do |found|
        _(found).must_equal %w{a_test.sh}
      end
    end

    it "ignores files whose suffix only looks right" do
      selecting("nottest.sh", "a_testing.sh", "a_test.rb", "a_test.txt") do |found|
        _(found).must_be_empty
      end
    end

    it "returns a stable order regardless of creation order" do
      selecting("z_test.sh", "a_test.sh", "m_spec.bash") do |found|
        _(found).must_equal %w{a_test.sh m_spec.bash z_test.sh}
      end
    end

    it "returns an empty array for a suite with no tests" do
      Dir.mktmpdir { |dir| _(Busser::RunnerPlugin::Bash.test_files_in(dir)).must_equal [] }
    end

    it "does not descend into subdirectories" do
      Dir.mktmpdir do |dir|
        Dir.mkdir(File.join(dir, "nested"))
        File.write(File.join(dir, "nested", "a_test.sh"), "")
        _(Busser::RunnerPlugin::Bash.test_files_in(dir)).must_be_empty
      end
    end

    it "accepts a Pathname as well as a String" do
      Dir.mktmpdir do |dir|
        File.write(File.join(dir, "a_test.sh"), "")
        _(Busser::RunnerPlugin::Bash.test_files_in(Pathname.new(dir)).size).must_equal 1
      end
    end
  end
end
