# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hooks/execution_hooks/version'

Gem::Specification.new do |spec|
  spec.name          = "hooks-execution_hooks"
  spec.version       = Hooks::ExecutionHooks::VERSION
  spec.authors       = ["Salone Gupta"]
  spec.email         = ["salonegupta@gmail.com"]
  spec.summary       = %q{A general purpose framework which provides execution hook feature for any Ruby class or module.}
  spec.description   = %q{Rails provide a feature of before_action, using which user can specify which hook needs to be executed before the intended method call. But if we want to achieve the same without rails...
Execution Hooks is a general purpose framework which provides this feature for any Ruby class or module. User can include this module in his existing/new class or module. He can specify the hook that needs to be executed before given method. That's all, the framework will take care of the rest.}
  spec.homepage      = "https://github.com/Salone-Learning/hooks-execution_hooks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
