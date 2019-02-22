# <a name="title"></a> Busser::RunnerPlugin::Bash

[![Gem Version](https://badge.fury.io/rb/busser-bash.png)](http://badge.fury.io/rb/busser-bash)
[![Build Status](https://travis-ci.org/test-kitchen/busser-bash.png?branch=master)](https://travis-ci.org/test-kitchen/busser-bash)
[![Code Climate](https://codeclimate.com/github/test-kitchen/busser-bash.png)](https://codeclimate.com/github/test-kitchen/busser-bash)

A Busser runner plugin for testing bash scripts

## Status

This software project is no longer under active development as it has no active maintainers. The software may continue to work for some or all use cases, but issues filed in GitHub will most likely not be triaged. If a new maintainer is interested in working on this project please come chat with us in #test-kitchen on Chef Community Slack.

## <a name="installation"></a> Installation and Setup

Please read the Busser [plugin usage][plugin_usage] page for more details.

## <a name="usage"></a> Usage

Please put test files into [COOKBOOK]/test/integration/[SUITES]/bash/

```cookbook
`-- test
    `-- integration
        `-- default
            `-- bash
                `--my_test.sh
```

The exit code of the script is used as indicator for failure or success.

### <a name="note"></a> Note

Globbing pattern to match files is `"bash/*_{test,spec}.{sh,bash}"`.

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors

Created and maintained by [Fletcher Nichol][author] (<fnichol@nichol.ca>)

## <a name="license"></a> License

Apache 2.0 (see [LICENSE][license])


[author]:           https://github.com/fnichol
[issues]:           https://github.com/fnichol/busser-bash/issues
[license]:          https://github.com/fnichol/busser-bash/blob/master/LICENSE
[repo]:             https://github.com/fnichol/busser-bash
[plugin_usage]:     http://docs.kitchen-ci.org/busser/plugin-usage
