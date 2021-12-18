require_relative '../lib/gh_compare'

RSpec.describe GhCompare do
  it "has a version number" do
    expect(GhCompare::VERSION).not_to be nil
  end

  describe 'remote_url' do
    context 'ssh' do
      let(:commit_compare) { GhCompare::CommitCompare.new }

      before 'ssh setting' do
        allow(commit_compare).to receive(:remote_origin).and_return('git@github.com:kenzo-tanaka/test.git')
      end

      it 'return github url' do
        expect(commit_compare.remote_url).to eq 'https://github.com/kenzo-tanaka/test'
      end
    end

    context 'url' do
      let(:commit_compare) { GhCompare::CommitCompare.new }

      before 'remote url setting' do
        allow(commit_compare).to receive(:remote_origin).and_return('https://github.com/kenzo-tanaka/test.git')
      end

      it 'return github url' do
        expect(commit_compare.remote_url).to eq 'https://github.com/kenzo-tanaka/test'
      end
    end
  end
end
