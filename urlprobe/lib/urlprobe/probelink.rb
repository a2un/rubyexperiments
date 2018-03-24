require 'net/http'

class UrlProbe::ProbeLink
    def initialize(url)
        @uri_str=''
        if !url.start_with?('http')
            @uri_str = 'http://' + url          #defaults to http
        else
           @uri_str = url 
        end
        @timeout=10
        @port_service=80
        #resp = request
        #return resp
    end

    def probe()
        puts 'Probing url: ' + @uri_str
        uri = URI(@uri_str)
        sslparams = {:use_ssl => uri.scheme == "https"}
        
        start_time = Time.now
        resp = Net::HTTP.get_response(uri)
        responsetime = Time.now - start_time

        if resp.code == "301"
            uri.query = URI.encode_www_form(sslparams)
            start_time = Time.now
            resp = Net::HTTP.get_response(uri)
            responsetime = Time.now - start_time
        end

        return responsetime
    end

end