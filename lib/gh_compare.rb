require "gh_compare/version"

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
