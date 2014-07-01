require_relative "../url_trimmer"

module URLTrimmer
  class Differ
    def self.between(urls1, urls2)
      unique_urls1 = Worker.uniq_by_domain(urls1)
      unique_urls1.map! { |url| url[Worker::URL_REGEXP, 0]  }
      domains1 = unique_urls1.map { |url| DomainName(url).domain }
      
      unique_urls2 = Worker.uniq_by_domain(urls2)
      unique_urls2.reject! do |url|
        u = url[Worker::URL_REGEXP, 0]
        domains1.include?(DomainName(u).domain)
      end
      unique_urls2.sort!
      unique_urls2
    end
  end
end