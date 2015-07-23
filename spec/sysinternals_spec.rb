require 'chefspec'

describe 'winbox::sysinternals' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe)}

  it 'should install powershell using chocolatey' do
    stub_command("test-path 'C:\\ProgramData\\chocolatey\\bin\\choco.exe'").and_return(true)
    stub_command("(get-wmiobject Win32_MSIResource | Where-Object -Property value -like -Value sysinternals) -eq $null").and_return(true)

    expect(chef_run).to run_powershell_script('sysinternals')
  end
end