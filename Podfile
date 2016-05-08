source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

# Uncomment this line if you need Swift support:
# use_frameworks!


# Networking
pod 'AFNetworking'
pod 'FormatterKit'    # For all your string formatting needs
pod 'Mantle'          # Github's model framework


# Inform CocoaPods that we use some custom build configurations
# Leave this in place unless you've tweaked the project's targets and configurations.
xcodeproj 'smarthouse',
  'Debug_Staging'   => :debug,   'Debug_Production'   => :debug,
  'Test_Staging'    => :debug,   'Test_Production'    => :debug,
  'AdHoc_Staging'   => :release, 'AdHoc_Production'   => :release,
  'Profile_Staging' => :release, 'Profile_Production' => :release,
  'Distribution'    => :release


# After every installation, copy the license settings plist over to our project
post_install do |installer|
  require 'fileutils'

  acknowledgements_plist = 'Pods/Target Support Files/Pods/Pods-Acknowledgements.plist'
  if Dir.exists?('smarthouse/Resources/Settings.bundle') && File.exists?(acknowledgements_plist)
    FileUtils.cp(acknowledgements_plist, 'smarthouse/Resources/Settings.bundle/Acknowledgements.plist')
  end
end
