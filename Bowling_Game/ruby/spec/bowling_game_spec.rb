# frozen_string_literal: true

require_relative '../lib/bowling_game'

describe BowlingGame do
  let(:game) { described_class.new }

  it 'scores gutter game to 0' do
    gutter_rolls = [0] * 20
    game.pins(gutter_rolls)
    expect(game.score).to eq(0)
  end

  it 'scores game of 1s to 20' do
    rolls = [1] * 20
    game.pins(rolls)
    expect(game.score).to eq(20)
  end

  it 'scores games of 1 spare' do
    rolls = [4, 6, 5] + [0] * 17
    game.pins(rolls)
    expect(game.score).to eq(20)
  end

  it 'scores games of 1 spare and 1s to 29' do
    rolls = [5] * 2 + [1] * 18
    game.pins(rolls)
    expect(game.score).to eq(29)
  end

  it 'scores games of 2 spares and 1s to 42' do
    rolls = [5] * 4 + [1] * 16
    game.pins(rolls)
    expect(game.score).to eq(15 + 11 + 16)
  end

  it 'scores games of 1 strike and 1s to 30' do
    rolls = [10] + [1] * 18
    game.pins(rolls)
    expect(game.score).to eq(30)
  end

  it 'scores games of full spare to 150' do
    rolls = [5] * 21
    game.pins(rolls)
    expect(game.score).to eq(150)
  end

  it 'scores games of full strike to 300' do
    rolls = [10] * 12
    game.pins(rolls)
    expect(game.score).to eq(300)
  end
end

# 1 strike
# 2 strike
# full spare
# full strike
# normal game
