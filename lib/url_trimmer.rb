require_relative "url_trimmer/version"
require "domain_name"

module URLTrimmer
  class Worker
    def self.uniq_by_domain(urls)
      urls.map! do |url|
        begin
          url.downcase
        rescue ArgumentError
          url.encode("UTF-8", invalid: :replace, undef: :replace, replace: "").downcase
        end
      end
      urls.map! { |url| url[%r(\Ahttps?://[^/]+), 0] }
      urls.compact!
      urls.uniq! { |url| DomainName(url).domain }
      urls
    end
  end
end
