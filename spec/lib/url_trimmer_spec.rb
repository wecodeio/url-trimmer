require_relative "../spec_helper"
require_relative "../../lib/url_trimmer"

module URLTrimmer
  describe Worker do
    let(:urls) do
      ["http://www.google.com.ar/blah1", "https://www.google.com.ar/blah2", "https://www.google.com.br/blah3",
       "http://www.google.com/blah4", "https://plus.google.com/blah5"]
    end

    it "returns a list of unique URLs by domain" do
      unique_urls = Worker.uniq_by_domain(urls)

      unique_urls.size.must_equal 3
      unique_urls.must_include("http://www.google.com.ar/blah1")
      unique_urls.must_include("https://www.google.com.br/blah3")
      unique_urls.must_include("http://www.google.com/blah4")
    end
  end
end
