require_relative "lib/uxid/version"
here = File.expand_path "..", __FILE__

Gem::Specification.new do |spec|
  spec.name          = "uxid"
  spec.version       = UXID::VERSION
  spec.authors       = ["JohnnyT"]
  spec.email         = ["ubergeek3141@gmail.com"]

  spec.summary       = "Generates IDs like: cus_01EPEY1JMKXVBT and txn_01EPEY2P06TR1RTV07XA82ZGJJ (similar to Stripe identifiers)."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/riddler/uxid/tree/master/impl/rb"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new ">= 2.3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir here do
    `git ls-files -z`.split("\x0").reject { |f| f.match %r{^(test|spec|features)/} }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename f }
  spec.require_paths = ["lib"]
end
