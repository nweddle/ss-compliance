sysroot = ENV['SystemRoot'].split(File::ALT_SEPARATOR)
sysvol = sysroot.first

control 'encryption-1' do
  impact 1
  title 'Ensure system boot volume is encrypted'
  desc '
  '
  tag 'windows', 'encryption'
  tag cce: 'CCE-27072-8'

  describe command("manage-bde -status #{sysvol}") do
    its('stdout') { should cmp 'Fully Encrypted' }
    its('stdout') { should_not cmp 'Fully Decrypted' }
    its('stdout') { should cmp 'Protection On' }
    its('stdout') { should_not cmp 'Protection Off' }
    its('exit_status') { should eq 0 }
  end
end
