Pod::Spec.new do |spec|

    # Root
    spec.name = 'Papuga'
    spec.version = '0.2.5'
    spec.license = { :type => 'MIT' }
    spec.homepage = 'https://github.com/HLTech/Papuga'
    spec.authors = { 'Kamil Wyszomierski' => 'kamil.wyszomierski@gmail.com' }
    spec.summary = 'Mocking framework for unit tests which brings experience similar to "Mockito".'
    spec.source = { :git => 'https://github.com/HLTech/Papuga.git', :tag => spec.version }
    spec.source_files = 'Papuga/Source/**/*'
    spec.swift_version = '4.2'

    # Platform
    spec.frameworks = 'XCTest'
    spec.platform = :ios, '9.3'
    spec.resources = 'Templates/*'

    # Subspecs
    spec.dependency 'Sourcery'
end
