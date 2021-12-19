RSpec.describe GhCompare::Exec::CommitCompare do
  describe 'run' do
    let(:executor) { GhCompare::Exec::CommitCompare.new }

    subject { executor.run }

    it 'return compare url' do
      expect(subject).to eq 'https://github.com/kenzo-tanaka/test/compare/6ac8a0a82033ef1cbaf2883dfd3aca6e6f77a36f...109d0bcc7fa26dcacbac8c6607fd0ca218346f96'
    end
  end
end