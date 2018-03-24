class UrlProbe
    # type the url of the path followed by space and timeinterval t with overall time T
    # usage: ruby lib/urlprobe.rb 
    #        url t T
    def self.runprobe()
        #check if internet connection there
        #probe
        @run = true
        while @run
            print ">  "
            args = gets.chomp.split()
            if args.class.to_s != nil.class.to_s and args.length == 3
                @probe = Probe.new(args)
                @probe.run()
                @probe.avg_resp_time() 
            elsif args.class.to_s != nil.class.to_s and args.length == 1 and args[0].to_s == "stop"
                @run = false
            else
                puts "supply 3 arguments or type 'stop' to exit"
                @run = false
            end
        end
    end
    
end
require_relative 'urlprobe/probe'