# busser-bash

[![Gem Version](https://badge.fury.io/rb/busser-bash.svg)](https://badge.fury.io/rb/busser-bash)

A [Busser](https://github.com/test-kitchen/busser) runner plugin that runs bash
scripts as integration tests.

Busser installs this plugin on the machine under test and hands it every file in
the suite's `bash` directory. Each script is run with `bash`, and its exit code
decides whether the test passed — so any script that already uses `set -e`, or
ends in a command whose status you care about, is a working test with no
framework to learn.

## Status

This software project is no longer under active development as it has no active
maintainers. The software may continue to work for some or all use cases, but
issues filed in GitHub will most likely not be triaged. If a new maintainer is
interested in working on this project please come chat with us in #test-kitchen
on Chef Community Slack.

## Requirements

Ruby 3.2 or newer, and busser 0.9.0 or newer.

## Installation

Busser installs the plugin for you when Test Kitchen runs the suite, so there is
usually nothing to do. To install it by hand:

```bash
busser plugin install busser-bash
```

## Usage

Put your scripts in the `bash` directory of a suite:

```text
test
`-- integration
    `-- default          # suite name
        `-- bash
            |-- my_test.sh
            `-- other_spec.bash
```

Only files matching `*_{test,spec}.{sh,bash}` are picked up. A file named
`helper.sh` sitting alongside them is ignored, which is a convenient way to keep
shared setup out of the run.

A script passes when it exits `0`:

```bash
#!/usr/bin/env bash
set -euo pipefail

test -f /usr/local/foobar.txt
grep -q "hello" /usr/local/foobar.txt
```

Test Kitchen picks the plugin up from the suite directory name — no verifier
configuration is needed beyond the default busser verifier.

## Using it with Test Kitchen

This is how most people run it, and it needs no Busser commands of your own.
Select the verifier in `kitchen.yml`:

```yaml
verifier:
  name: busser

suites:
  - name: default
```

Then put your tests in a `bash` directory inside the suite:

```text
test/integration/default/bash/smoke_test.sh
```

`kitchen verify` installs Busser and this plugin on the instance and runs them.
The directory name is what selects this plugin -- there is nothing else to
configure.

## When nothing runs

If the suite files do not match what this plugin looks for, the run prints one
line and **exits `0`**:

```text
-----> Running bash test suite
```

No tests ran, and nothing said so. Work through these in order:

1. **Is the directory named `bash`?** That name alone selects this plugin.
   `bashs/`, `tests/` or anything else is not picked up.
2. **Do the filenames match?** Only `*_test.sh`, `*_test.bash`, `*_spec.sh`
   and `*_spec.bash` are run -- `mytest.sh` is *not* picked up.
3. **Is the plugin installed?** `busser plugin list` shows what is available.
4. **Is `BUSSER_ROOT` what you think?** `busser suite path` prints where suites
   are actually being looked for.

## Contributing

Bug reports and pull requests are welcome. See
[CONTRIBUTING.md](CONTRIBUTING.md) for how to set up the project, run the test
suite, and format your commits.

## License

Apache License 2.0. See [LICENSE](LICENSE).

Originally created by [Fletcher Nichol](https://github.com/fnichol).
