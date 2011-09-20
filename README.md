Description
===========

Manage git repositories, provide access to them over SSH, with tight access control and not needing shell accounts.

Instructions taken from http://scie.nti.st/2007/11/14/hosting-git-repositories-the-easy-and-secure-way

Requirements
============

- Depends on git and python cookbooks
- Tested only on Ubuntu 10.04 LTS

Attributes
==========

Usage
=====

Currently expects a "users" data bag with a gitosis-admin group listed like so:

	users
	  id: john.smith
	  groups: [ "sysadmin", "gitosis-admin" ]
	  ssh_keys: "rsa-key ... =comment"
	  ...etc

With this layout, it will take the ssh_key for this user. If multiple users have the "gitosis-admin" group, it will take the first user in the returned array.
