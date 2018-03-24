########Steps to use
assuming git, ruby are installed and configured correctly
Build from source:
`` git clone https://github.com/a2un/rubyexperiments
   cd rubyexperiments/urlprobe
   gem build urlprobe.gemspec
   gem install urlprobe-1.0.0.gem
``
To use the gem:
``
  git clone https://github.com/a2un/rubyexperiments
  cd rubyexperiments/urlprobe
  gem install urlprobe-1.0.0.gem
``

now launch the interactive ruby shell and run the commands:
``
     require 'urlprobe'
     UrlProbe.runprobe()
``
In the repl shell that appears type "stop" to leave or supply three arguments as below:
``
    > https://about.gitlab.com 10 1      #<url> <interval(in seconds)> <totaltime(in minutes)> to run the probe
``