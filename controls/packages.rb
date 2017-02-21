control 'package-1' do
  impact 0.5
  title 'Ensure Slack Windows app is installed'
  desc '
  Windows Slack application should be installed.
  '
  tag 'windows', 'application'
  tag cce: 'CCE-27072-8'

  describe package('Slack') do
    it { should be_installed }
  end
end
