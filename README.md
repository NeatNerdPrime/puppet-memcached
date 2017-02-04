# memcached

Tested with Travis CI

[![Build Status](https://travis-ci.org/bodgit/puppet-memcached.svg?branch=master)](https://travis-ci.org/bodgit/puppet-memcached)
[![Coverage Status](https://coveralls.io/repos/bodgit/puppet-memcached/badge.svg?branch=master&service=github)](https://coveralls.io/github/bodgit/puppet-memcached?branch=master)
[![Puppet Forge](http://img.shields.io/puppetforge/v/bodgit/memcached.svg)](https://forge.puppetlabs.com/bodgit/memcached)
[![Dependency Status](https://gemnasium.com/bodgit/puppet-memcached.svg)](https://gemnasium.com/bodgit/puppet-memcached)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with memcached](#setup)
    * [Beginning with memcached](#beginning-with-memcached)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module manages Memcached.

## Setup

### Beginning with memcached

In the very simplest case, you can just include the following:

```puppet
include ::memcached
```

## Usage

Install Memcached and configure to use 128 MB:

```puppet
class { '::memcached':
  cache_size => 128,
}
```

Install the Python client bindings:

```puppet
include ::memcached::python
```

## Reference

The reference documentation is generated with
[puppet-strings](https://github.com/puppetlabs/puppet-strings) and the latest
version of the documentation is hosted at
[https://bodgit.github.io/puppet-memcached/](https://bodgit.github.io/puppet-memcached/).

## Limitations

This module has been built on and tested against Puppet 4.4.0 and higher.

The module has been tested on:

* RedHat Enterprise Linux 6/7
* Ubuntu 14.04/16.04
* Debian 7/8
* OpenBSD 6.0

## Development

The module has both [rspec-puppet](http://rspec-puppet.com) and
[beaker-rspec](https://github.com/puppetlabs/beaker-rspec) tests. Run them
with:

```
$ bundle exec rake test
$ PUPPET_INSTALL_TYPE=agent PUPPET_INSTALL_VERSION=x.y.z bundle exec rake beaker:<nodeset>
```

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-memcached).
