#!/usr/bin/env bash

useradd -m os161user
apt-get update
apt-get install -y wget gcc g++ make libncurses5-dev libmpc-dev python2.7 bmake


