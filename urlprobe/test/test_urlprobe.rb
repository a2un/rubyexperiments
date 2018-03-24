require 'test/unit'
require 'urlprobe'

class UrlProbeTest < Test::Unit::TestCase
    def test_no_err_return
        assert_equal nil, UrlProbe.runprobe()
    end
end