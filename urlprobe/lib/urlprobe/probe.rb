require_relative 'probelink'

class UrlProbe::Probe
    def initialize(args)
        @url = args[0].to_s
        @interval = args[1].to_i            #assumption interval in seconds
        @totaltime = args[2].to_i           #assumption total time in minutes
        @start_time = 0
        @countbatch = 1
        @upto_time = @interval-1
        @total_resp_time = 0.to_f
        @avg_resp_time=0
        @timeout = 10
        @port_service =80

        if @url.start_with?('http')
            @host = URI.parse(@url).host
            puts @host
        else
            @host = URI.parse('http://'+@url).host
        end
        
        if @host.class.to_s != nil.class.to_s and !self.pingecho(@host,@timeout,@port_service)
            puts 'No internet connection'
            @conn=false
        else
            @conn=true
        end
    end

    def run()
        while @countbatch <= (@totaltime)*60/@interval and @conn
            resp_time = UrlProbe::ProbeLink.new(@url)
            @probe_resp_time = resp_time.probe()
            @total_resp_time = @total_resp_time.to_f + @probe_resp_time.to_f
            puts @countbatch.to_s + '. Probe response time: ' + @probe_resp_time.to_f.to_s
            @start_time.upto(@upto_time){ |t|
                #puts t
                sleep 1
                #puts "count" + count.to_s
            }
            #puts "count" + count.to_s
            #puts self.probelink(args[0])
            @start_time = @upto_time + 1.to_i
            @upto_time += 10
            @countbatch += 1
        end
        #puts @total_resp_time
        #runcallurl every t seconds for T minutes
            #call url
            #collect response time = 2* time one way
        #print avg response time
    end

    def avg_resp_time()
        if @conn
            @avg_resp_time = (@total_resp_time/@countbatch.to_f).round(2)
            puts 'average response time: ' + @avg_resp_time.to_s
        end
    end

    
    ##source https://ruby-doc.org/stdlib-1.8.7/libdoc/ping/rdoc/Ping.html
    def pingecho(host, timeout=5, service="echo")
        begin
          Timeout.timeout(timeout) do
            s = TCPSocket.new(host, service)
            s.close
          end
        rescue Errno::ECONNREFUSED
          return true
        rescue Timeout::Error, StandardError
          return false
        end
        return true
    end
end