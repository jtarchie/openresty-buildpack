require 'spec_helper'

describe 'When deploying an app with luarocks dependencies' do
  it 'successfuly serves the endpoint /luarocks' do
    Hatchet::GitApp.new('openresty-luarocks', buildpack_url: 'https://github.com/jtarchie/openresty-buildpack.git#test').deploy do |app|
      expect(app.output).to include 'Installing Luarocks'
      output = `curl http://#{app.name}.herokuapp.com/luarocks`
      expect(output).to include "rocks and md5 loaded"
      expect(output).to include "bar loaded"
      expect(output).to include "85e73df5c41378f830c031b81e4453d2"
    end
  end
end



