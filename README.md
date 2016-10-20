# memcached

Tested with Travis CI

[![Build Status](https://travis-ci.org/bodgit/puppet-memcached.svg?branch=master)](https://travis-ci.org/bodgit/puppet-memcached)
[![Coverage Status](https://coveralls.io/repos/bodgit/puppet-memcached/badge.svg?branch=master&service=github)](https://coveralls.io/github/bodgit/puppet-memcached?branch=master)
[![Puppet Forge](http://img.shields.io/puppetforge/v/bodgit/memcached.svg)](https://forge.puppetlabs.com/bodgit/memcached)
[![Dependency Status](https://gemnasium.com/bodgit/puppet-memcached.svg)](https://gemnasium.com/bodgit/puppet-memcached)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with memcached](#setup)
    * [What memcached affects](#what-memcached-affects)
    * [Beginning with memcached](#beginning-with-memcached)
4. [Usage - Configuration options and additional functionality](#usage)
    * [Classes and Defined Types](#classes-and-defined-types)
        * [Class: memcached](#class-memcached)
        * [Class: memcached::python](#class-memcachedpython)
    * [Examples](#examples)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages Memcached.

## Module Description

This module can install and configure the Memcached package and service.

## Setup

### What memcached affects

* The package providing the Memcached software.
* The flags controlling operation of the software.
* The service controlling the `memcached` daemon.
* Python client bindings.

### Beginning with memcached

```puppet
include ::memcached
```

## Usage

### Classes and Defined Types

#### Class: `memcached`

**Parameters within `memcached`:**

##### `cache_size`

The size of the cache used, expressed in megabytes.

##### `max_connections`

The maximum number of concurrent TCP connections allowed.

##### `package_name`

The name of the package to install that provides the Memcached software.

##### `port`

The TCP port to bind to.

##### `service_name`

The name of the service managing the Memcached daemon.

##### `user`

The user to run as.

#### Class: `memcached::python`

**Parameters within `memcached::python`:**

##### `package_name`

The package to install that provides the Python client bindings.

### Examples

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

### Classes

#### Public Classes

* [`memcached`](#class-memcached): Main class for managing Memcached.
* [`memcached::python`](#class-memcachedpython): Class for managing Python
  client bindings.

#### Private Classes

* `memcached::install`: Handles Memcached installation.
* `memcached::config`: Handles Memcached configuration.
* `memcached::params`: Different configuration data for different systems.
* `memcached::service`: Manages the `memcached` service.

## Limitations

This module has been built on and tested against Puppet 3.0 and higher.

The module has been tested on:

* RedHat/CentOS Enterprise Linux 6/7

Testing on other platforms has been light and cannot be guaranteed.

## Development

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-memcached).
