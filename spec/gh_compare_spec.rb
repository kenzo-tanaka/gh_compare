require_relative '../lib/gh_compare'

RSpec.describe GhCompare do
  it 'has a version number' do
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

  describe 'compare_url' do
    let(:commit_compare) { GhCompare::CommitCompare.new }

    before 'ssh setting' do
      allow(commit_compare).to receive(:remote_origin).and_return('git@github.com:kenzo-tanaka/test.git')
    end

    subject do
      commit_compare.compare_url('6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f', '109d0bcc7fa26dcacbac8c6607fd0ca218346f96')
    end

    it 'return compare url' do
      expect(subject).to eq 'https://github.com/kenzo-tanaka/test/compare/6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f...109d0bcc7fa26dcacbac8c6607fd0ca218346f96'
    end
  end

  describe 'compare_before(n)' do
    let(:commit_compare) { GhCompare::CommitCompare.new }

    before 'ssh setting' do
      allow(commit_compare).to receive(:remote_origin).and_return('git@github.com:kenzo-tanaka/test.git')
    end

    before 'fix commit hash' do
      allow(commit_compare).to receive(:head).and_return('6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f')
      allow(commit_compare).to receive(:head_before).and_return('109d0bcc7fa26dcacbac8c6607fd0ca218346f96')
    end

    subject { commit_compare.compare_before(3) }

    it 'return compare url' do
      expect(subject).to eq 'https://github.com/kenzo-tanaka/test/compare/6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f...109d0bcc7fa26dcacbac8c6607fd0ca218346f96'
    end
  end
end
