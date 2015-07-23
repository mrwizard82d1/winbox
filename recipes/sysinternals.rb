# Cookbook Name:: winbox
# Recipe:: sysinternals
#
# Copyright 2015, Larry Jones
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

include_recipe 'winbox::chocolatey_install'
include_recipe 'winbox::powershell4'

powershell_script 'sysinternals' do
  code <<-EOH
chocolatey install sysinternals -y
if ($LASTEXITCODE -ne 0)
{
  $LASTEXITCODE = 0
  chocolatey install sysinternals -y
}
  EOH
  only_if '(choco list --local-only | select-string -pattern sysinternals) -eq $null'
end
