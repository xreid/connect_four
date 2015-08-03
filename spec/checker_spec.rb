module ConnectFour
  describe Checker do
    let(:checker) { Checker.new(:red, :Sampha) }

    describe '#new' do
      it 'cerates a new checker' do
        expect(checker).to be_a Checker
      end
      it 'assigns a color to the checker' do
        expect(checker.color).to eq :red
      end
      it 'assigns an owner to the checker' do
        expect(checker.owner).to eq :Sampha
      end
    end
  end
end
