# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'DokuPaySdk' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DokuPaySdk

  target 'DokuPaySdkTests' do
    # Pods for testing
  end

end

def info_post_install(installer)
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
            config.build_settings['INFOPLIST_FILE'] = 'Target Support Files/'+target.name+'/'+target.name+'-Info.plist'
        end
    end

end

post_install do |installer|
  info_post_install(installer)
end
