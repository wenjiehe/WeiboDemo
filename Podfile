# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
	
target 'WeiboDemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for WeiboDemo

   pod 'SnapKit', '~> 4.0.0'
   pod 'Alamofire', '~> 4.7.2'
  
  # 开发环境
  pod 'SwiftLint'

end

post_install do |installer|
    system("git config --local core.hooksPath '.githooks'")
end
