# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-simplex"
  spec.version       = "0.9.8.15"
  spec.authors       = ["Ondrej Golasowski"]
  spec.email         = ["golasowski.o@gmail.com"]

  spec.summary       = "An original theme for golasblog project."
  spec.homepage      = "https://github.com/andreondra/jekyll-theme-simplex"
  spec.license       = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files                   = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^(assets|_(data|_includes|_layouts|_sass)/|(LICENSE|README|CHANGELOG)((\.(txt|md|markdown)|$)))}i)
  end

  # spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  # spec.add_runtime_dependency "jekyll", "~> 4.0"

  # spec.add_development_dependency "bundler", "~> 2.0"
  # spec.add_development_dependency "rake", "~> 12.0"

  spec.add_runtime_dependency "jekyll", ">= 3.7", "< 5.0"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.3"
  spec.add_runtime_dependency "jekyll-gist", "~> 1.5"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.1"
  spec.add_runtime_dependency "jekyll-include-cache", "~> 0.1"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", ">= 12.3.3"
end
