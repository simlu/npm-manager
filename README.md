# NPM Manager

[![Build Status](https://img.shields.io/travis/simlu/npm-manager/master.svg)](https://travis-ci.org/simlu/npm-manager)
[![Test Coverage](https://img.shields.io/coveralls/simlu/npm-manager/master.svg)](https://coveralls.io/github/simlu/npm-manager?branch=master)
[![Greenkeeper Badge](https://badges.greenkeeper.io/simlu/npm-manager.svg)](https://greenkeeper.io/)
[![Dependencies](https://david-dm.org/simlu/npm-manager/status.svg)](https://david-dm.org/simlu/npm-manager)
[![NPM](https://img.shields.io/npm/v/npm-manager.svg)](https://www.npmjs.com/package/npm-manager)
[![Downloads](https://img.shields.io/npm/dt/npm-manager.svg)](https://www.npmjs.com/package/npm-manager)
[![Semantic-Release](https://github.com/simlu/js-gardener/blob/master/assets/icons/semver.svg)](https://github.com/semantic-release/semantic-release)
[![Gardener](https://github.com/simlu/js-gardener/blob/master/assets/badge.svg)](https://github.com/simlu/js-gardener)
[![Gitter](https://github.com/simlu/js-gardener/blob/master/assets/icons/gitter.svg)](https://gitter.im/simlu/npm-manager)

CLI Wrapper around NPM

## Getting Started

    # npm i -g npm-manager

## Commands

Can run all commands with `npm-manager ...` or `nm` (alias)

### nm persist [pkg]

Persist dependencies of current project into `offline/package-json.tar.gz`

Can persist custom dependencies e.g. with `nm persist npm@6.1.0` to `offline/npm@6.1.0.tar.gz`.

### nm install [pkg]

Install dependencies from `offline/package-json.tar.gz`. Will throw an error if not in sync.

Can install global dependencies e.g. with `nm install npm@6.1.0` from `offline/npm@6.1.0.tar.gz`.

### nm verify [pkg]

Verify that dependency offline cache is valid.

## How it works

Uses npm cache and saves / restores it into / from archive. Uses shell scripts, so unix is required.
