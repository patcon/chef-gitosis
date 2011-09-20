#
# Cookbook Name:: gitosis
# Recipe:: default
#
# Author:: Patrick Connolly <patrick@myplanetdigital.com>
#
# Copyright 2011, Myplanet Digital
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

%w{ git python }.each do |recipe|
  require_recipe recipe
end

git "/tmp/gitosis" do
  repository "git://eagain.net/gitosis.git"
  action :sync
end

bash "Installing gitosis" do
  cwd "/tmp/gitosis"
  code "python setup.py install"
end

user "git" do
  system true
  shell "/bin/sh"
  comment "git version control"
  home "/home/git"
  supports :manage_home => true
end

gitosis_admin_key = search(:users, "groups:gitosis-admin")[0]['ssh_keys']

file "/tmp/id_rsa.pub" do
  owner "git"
  group "git"
  mode "0644"
  content gitosis_admin_key
end

bash "Initialize gitosis" do
  code "sudo -H -u git gitosis-init < /tmp/id_rsa.pub"
end
