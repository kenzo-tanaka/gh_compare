require_relative '../lib/gh_compare'

RSpec.describe GhCompare do
  it 'has a version number' do
    expect(GhCompare::VERSION).not_to be nil
  end
end
