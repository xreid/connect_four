module ConnectFour
  describe Player do
    let(:player) { Player.new(:Sampha, :red) }

    describe '#new' do
      it 'creates a new player' do
        expect(player).to be_a Player
      end
      it 'assigns a name to the player' do
        expect(player.name).to eq :Sampha
      end
      it 'assigns a checker to the player' do
        expect(player.checker).to eq :red
      end
    end
  end
end
