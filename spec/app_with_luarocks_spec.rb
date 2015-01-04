require 'spec_helper'

describe 'When deploying an app with luarocks dependencies' do
  it 'successfuly serves the endpoint /luarocks' do
    deploy_app('openresty-luarocks') do |app|
      sleep(0.1) while !app.deployed?
      expect(app.output).to include 'Installing LuaRocks'
      output = `curl http://#{app.name}.herokuapp.com/luarocks`
      expect(output).to include "rocks and md5 loaded"
      expect(output).to include "bar loaded"
      expect(output).to include "85e73df5c41378f830c031b81e4453d2"
    end
  end
end



