Gem::Specification.new do |s|
    s.name = "urlprobe"
    s.version="1.0.0"
    s.default_executable = "urlprobe"
    s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
    s.authors = ["Arun Balajiee"]
    s.date = %q{2018-03-23}
    s.description = %q{probes a url and returns  average response time}
    s.email = %q{cs11b042@iith.ac.in}
    s.files = ["Rakefile", "lib/urlprobe.rb", "bin/urlprobe","lib/urlprobe/probe.rb","lib/urlprobe/probelink.rb"]
    s.test_files = ["test/test_urlprobe.rb"]
    s.homepage = %q{http://github.com/a2un/rubyexperiments}
    s.require_paths = ["lib"]
    s.rubygems_version = %q{2.6.14}
    s.summary = %q{probes the link every 10 seconds in minute and gives response}
    s.licenses = ['Nonstandard']
    if s.respond_to? :specification_version then
      s.specification_version = 3
  
      if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      else
      end
    else
    end
end