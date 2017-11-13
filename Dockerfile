FROM centos:centos7
MAINTAINER Andrey Kartashov <gorilych@gmail.com>

RUN yum update -y && \
  yum install -y epel-release && \
  yum install -y \
  which git python-setuptools python-devel openssl-devel libffi-devel \
  libyaml-devel gcc wget diff patch rst2pdf

RUN easy_install virtualenv
RUN easy_install pip

# install https://github.com/pypa/virtualenv/pull/1010/commits
# to fix https://github.com/pypa/virtualenv/issues/985
RUN wget https://github.com/pypa/virtualenv/pull/1010.diff \
  && find /usr/lib/python2.7 -name virtualenv.py -exec patch \{\} 1010.diff \;

CMD /bin/bash
