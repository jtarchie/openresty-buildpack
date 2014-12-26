require 'spec_helper'

describe 'When an app is missing nginx.conf' do
  it 'does not detect it' do
    expect {
      Hatchet::Runner.new('-').deploy
    }.to raise_error(Anvil::Builder::BuildError)
  end
end
