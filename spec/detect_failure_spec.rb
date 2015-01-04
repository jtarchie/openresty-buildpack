require 'spec_helper'

describe 'When an app is missing nginx.conf' do
  it 'does not detect it' do
    expect {
      Hatchet::GitApp.new('-', buildpack_url: 'https://github.com/jtarchie/openresty-buildpack.git').deploy
    }.to raise_error(Anvil::Builder::BuildError)
  end
end
