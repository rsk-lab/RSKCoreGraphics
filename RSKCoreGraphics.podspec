Pod::Spec.new do |s|
  s.name          = 'RSKCoreGraphics'
  s.version       = '1.2.0'
  s.summary       = 'An addition to the CoreGraphics framework.'
  s.description   = <<-DESC
                   An addition to the CoreGraphics framework. RSKCoreGraphics provides the type of object that represents a rectangle in the lower-left-origin coordinate system.
                   DESC
  s.homepage      = 'https://github.com/rsk-lab/RSKCoreGraphics'
  s.license       = { :type => 'RPL-1.5 / R.SK Lab Professional', :file => 'COPYRIGHT.md' }
  s.authors       = { 'Ruslan Skorb' => 'ruslan@rsk-lab.com' }
  s.source        = { :git => 'https://github.com/rsk-lab/RSKCoreGraphics.git', :tag => s.version.to_s }
  s.platform      = :ios, '10.0'
  s.swift_version = '5.3'
  s.source_files  = 'RSKCoreGraphics/*.{h,swift}'
  s.requires_arc  = true
  s.dependency 'RSKFoundation', '1.3.0'
end
