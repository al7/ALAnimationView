Pod::Spec.new do |s|
   s.name = 'ALAnimationView'
   s.version = '0.1'
   s.platform = :ios
   s.summary = 'UIImage animation view for iOS'
   s.license = { :type => 'MIT', :file => 'LICENSE' }
   s.homepage = 'https://github.com/al7/ALAnimationView'
   s.author = { 'Alex Leite' => 'admin@al7dev.com' }
   s.source = {
        :git => 'https://github.com/al7/ALAnimationView.git',
        :tag => s.version.to_s
   }
   s.source_files = 'ALAnimationView/Source/*.{h,m}'
   s.frameworks = 'UIKit', 'QuartzCore'
   s.requires_arc = true
end