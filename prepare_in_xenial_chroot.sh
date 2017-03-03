#!/bin/sh
#
# This script installs makerware in Xenial chroot environment
#
#Copyright (C) 2017 Ying-Chun Liu (PaulLiu) <paulliu@debian.org>
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

apt-get update
apt-get upgrade
apt-get -y install software-properties-common wget

apt-add-repository 'http://downloads.makerbot.com/makerware/ubuntu'

apt-add-repository ppa:fkrull/deadsnakes

wget http://downloads.makerbot.com/makerware/ubuntu/dev@makerbot.com.gpg.key
apt-key add dev@makerbot.com.gpg.key

apt-get -y update

apt-get -y install makerware

