require 'spec_helper'

describe 'When an app is missing nginx.conf' do
  it 'does not detect it' do
    expect {
      deploy_app('-')
    }.to raise_error(Hatchet::App::FailedDeploy)
  end
end
