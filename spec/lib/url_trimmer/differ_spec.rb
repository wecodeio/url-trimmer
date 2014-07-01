require File.expand_path("spec/spec_helper")
require File.expand_path("lib/url_trimmer/differ")

module URLTrimmer
  describe Differ do
    describe ".between(urls1, urls2)" do
      let(:urls1) { %w(http://www.google.com/1 https://www.google.com.ar/2) }
      let(:urls2) do
        %w(https://www.google.com/3 http://www.google.com.ar/4 http://www.google.com.br/5 http://www.example.com/6)
      end
      
      it "removes URLs from urls2 already present in urls1" do
        unique_urls = Differ.between(urls1, urls2)
        
        unique_urls.size.must_equal 2
        unique_urls.must_include("http://www.google.com.br/5")
        unique_urls.must_include("http://www.example.com/6")
      end
    end
  end
end