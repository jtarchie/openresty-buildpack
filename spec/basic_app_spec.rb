require 'spec_helper'

describe 'When deploying a basic app' do
  it 'has nginx install in the path' do
    Hatchet::Runner.new('openresty-basic').deploy do |app|
      expect(app.output).to include 'OpenResty'
      expect(app.run('nginx -V')).to include '1.7.7.1'
      expect(`curl http://#{app.name}.herokuapp.com`).to include 'Hello, World'
    end
  end
end

