require 'uri'
require_relative './gh_compare/commit_compare'
require_relative './gh_compare/exec/commit_compare'

module GhCompare
  class Error < StandardError; end
end

