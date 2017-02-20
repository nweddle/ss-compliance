control 'screen-1' do
  impact 1
  title 'Enable and password protect the screen saver'
  desc '
  1) If you enable it, a screen saver runs, provided the following two conditions hold: First, a valid screen saver on the client is specified through the "screen saver executable name" setting or through Control Panel on the client computer. Second, the screen saver timeout is set to a nonzero value through the setting or Control Panel.
  2) If you enable this setting, all screen savers are password protected. This setting also disables the "Password protected" checkbox on the screen saver dialog in the Personalization or Display Control Panel, preventing users from changing the password protection setting.
  '
  tag 'windows', 'screen-saver'
  ref 'Enable screen saver', url: 'https://gpsearch.azurewebsites.net/#97'
  ref 'Password protect the screen saver', url: 'https://gpsearch.azurewebsites.net/#99'

  describe registry_key('Enable Screen Saver', 'HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop') do
    its('ScreenSaveActive') { should cmp 1 } # 1 = Enabled
  end

  describe registry_key('Enable Screen Saver Password', 'HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop') do
    its('ScreenSaverIsSecure') { should cmp 1 } # 1 = Enabled
  end
end

control 'screen-2' do
  impact 0.6
  title 'Configure the screen saver timeout'
  desc '
  Specifies how much user idle time must elapse before the screen saver is launched. When configured, this idle time can be set from a minimum of 1 second to a maximum of 86,400 seconds, or 24 hours. If set to zero, the screen saver will not be started.
  '
  tag 'windows', 'screen-saver'
  ref 'Screen saver timeout', url: 'https://gpsearch.azurewebsites.net/#100'

  describe registry_key('Configure Screen Saver Timeout', 'HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Control Panel\Desktop') do
    its('ScreenSaveTimeOut') { should cmp 600 } # 600 seconds = 10 minutes
  end
end
