# Cookbook Name:: winbox
# Recipe:: powershell4
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

powershell_script 'powershell4' do
  code <<-EOH
chocolatey install powershell4 -y
if ($LASTEXITCODE -ne 0)
{
  $LASTEXITCODE = 0
  chocolatey install powershell4 -y
}
  EOH
  # NOT IDEMPOTENT
  # only_if '(get-wmiobject Win32_MSIResource | Where-Object -Property value -like -Value sysinternals) -eq $null'
end

