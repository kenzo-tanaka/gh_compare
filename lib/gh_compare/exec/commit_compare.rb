require 'optparse'
require_relative '../commit_compare'

module GhCompare::Exec
  class CommitCompare
    attr_reader :options

    def initialize(args)
      @options = parse_args(args)
    end

    def run
      return compare_before if num_arg_passed?
      return compare_url if commit_arg_passed?
    end

    private

    def parse_args(args)
      opts = {}
      OptionParser.new do |opt|
        opt.on('--n=NUM', Integer) { |v| opts[:num] = v }
        opt.on('--d==V,V', Array) { |v| opts[:commits] = v }

        opt.parse!(args)
      end
      opts
    end

    def num_arg_passed?
      options[:num]
    end

    def compare_before
      GhCompare::CommitCompare.new.compare_before(options[:num])
    end

    def commit_arg_passed?
      options[:commits]
    end

    def compare_url
      GhCompare::CommitCompare.new.compare_url(from_commit, to_commit)
    end

    def from_commit
      options[:commits][0]
    end

    def to_commit
      options[:commits][1]
    end
  end
end