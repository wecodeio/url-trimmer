require_relative "url_trimmer/version"
require "domain_name"

module URLTrimmer
  class Worker
    URL_REGEXP = %r(\Ahttps?://([^/]+))

    def self.uniq_by_domain(urls)
      urls.map! do |url|
        begin
          url.downcase
        rescue ArgumentError
          url.encode("UTF-8", invalid: :replace, undef: :replace, replace: "").downcase
        end
      end
      urls.select! { |url| url =~ URL_REGEXP }
      urls.uniq! { |url| DomainName(url[URL_REGEXP, 1]).domain }
      urls.sort!
      urls
    end
  end
end
