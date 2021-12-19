require 'uri'

module GhCompare
  class Error < StandardError; end

  class CommitCompare
    attr_reader :remote_origin

    def initialize
      @remote_origin = get_remote_origin
    end

    def remote_url
      remote_url? ? remote_origin.gsub(/\.git$/, '') : ssh_to_url
    end

    def compare_url(from, to)
      remote_url + "/compare/#{from}...#{to}"
    end

    def compare_before(n)
      'https://github.com/kenzo-tanaka/test/compare/6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f...109d0bcc7fa26dcacbac8c6607fd0ca218346f96'
    end

    private

    def get_remote_origin
      `git config --get remote.origin.url`.strip
    end

    def remote_url?
      URI.parse(remote_origin).is_a?(URI::HTTP) rescue false
    end

    def ssh_to_url
      "https://github.com/#{remote_origin.gsub(/git@github.com:/, '').gsub(/\.git$/, '')}"
    end
  end
end
