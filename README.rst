==========================================
chef-solo environment test for chef-11.6.0
==========================================

:date: 2013/7/25

What is environment?
=====================

* in generic: http://docs.opscode.com/essentials_environments.html
* chef-solo: http://docs.opscode.com/release_notes.html#chef-solo-environments
* ticket: https://github.com/opscode/chef/pull/359


environment feature for chef-solo
=================================

solo.rb
-------

If solo.rb contain `environment` and `environment_path`, chef-solo environment
feature will work.

solo.rb::

   environment_path File.join(root, "./environments")
   environment "personal"

env_run_lists in role
---------------------

You can write `env_run_lists` in your role file with your environment name.

roles/test.json::

   "run_list": [
       "recipe[myrecipe::default_env]"
   ],
   "env_run_lists": {
       "personal": [
           "recipe[myrecipe::personal_env]"
       ]
   }

For example, if you set "personal" to environment in solo.rb,
`myrecipe::personal_env` will be invoked.
However `myrecipe::default_env` will not be invoked.
This means `run_list` is used to fallback for `env_run_lists`.

environment
-----------

You can write `default_attributes` and `override_attributes` in your
environment file.

environments/personal.json::

   "default_attributes": {},
   "override_attributes": {
       "myrecipe": {
           "name": "PERSONAL ENVIRONMENT name"
       }
   }

This `override_attributes` is high priority attribute settings.
It can override all other `default`, `normal` and `override` settings.
For example, your recipe setup strong iptables by default. If you did
not want to setup iptables in your personal develop environment, you can
override iptables enable/disable setting in personal.json file.

see also: http://docs.opscode.com/essentials_roles.html#attribute-precedence


chef solo tools
===============

chef-solo
---------

::

   sudo chef-solo -c solo.rb -j solo.json -l debug


knife solo
----------

I installed knife-solo 0.3.0.pre4 and pre5 with chef-11.6.0, but knife command
did not display `knife solo cook` command.


Vagrant
-------

Vagrant-1.2.4 did not support chef-solo environment yet.
vagrant chef-solo provisioner could not handle environment_path and
environment name in Vagrantfile.


paratrooper-chef
----------------

Not checked.

I think if paratrooper-chef will support environment name by using capistrano
multistage setting and generate environment aware solo.rb, it is very easy to
manage.

