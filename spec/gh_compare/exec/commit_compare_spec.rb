RSpec.describe GhCompare::Exec::CommitCompare do
  describe 'run' do
    context 'num option passed' do
      let(:executor) { GhCompare::Exec::CommitCompare.new(%w[-n 3]) }

      before 'mock commit compare' do
        commit_compare_mock = double('GhCompare::CommitCompare')
        allow(commit_compare_mock).to receive(:compare_before).and_return('https://github.com/kenzo-tanaka/test/compare/6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f...109d0bcc7fa26dcacbac8c6607fd0ca218346f96')
        allow(executor).to receive(:compare_before).and_return(commit_compare_mock.compare_before)
      end

      subject { executor.run }

      it 'return compare url' do
        expect(subject).to eq 'https://github.com/kenzo-tanaka/test/compare/6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f...109d0bcc7fa26dcacbac8c6607fd0ca218346f96'
      end
    end

    context 'commit hash passed' do
      let(:executor) { GhCompare::Exec::CommitCompare.new(%w[-d 6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f,109d0bcc7fa26dcacbac8c6607fd0ca218346f96]) }

      before 'mock commit compare' do
        commit_compare_mock = double('GhCompare::CommitCompare')
        allow(commit_compare_mock).to receive(:compare_url).and_return('https://github.com/kenzo-tanaka/test/compare/6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f...109d0bcc7fa26dcacbac8c6607fd0ca218346f96')
        allow(executor).to receive(:compare_url).and_return(commit_compare_mock.compare_url)
      end

      subject { executor.run }

      it 'return compare url' do
        expect(subject).to eq 'https://github.com/kenzo-tanaka/test/compare/6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f...109d0bcc7fa26dcacbac8c6607fd0ca218346f96'
      end
    end
  end
end