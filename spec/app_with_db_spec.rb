require 'spec_helper'
require 'json'

describe 'When deploying an app with a database' do
  it 'successfuly serves the endpoint /' do
    Hatchet::GitApp.new('openresty-postgres', buildpack_url: 'https://github.com/jtarchie/openresty-buildpack.git').deploy do |app|
      app.add_database
      expect(`heroku pg:psql -a #{app.name} < dump.sql`).to include 'DROP TABLE'
      output = `curl http://#{app.name}.herokuapp.com`
      expect(JSON.parse(output)).to eq [{"id"=>1, "name"=>"Annie"}, {"id"=>2, "name"=>"Bob"}, {"id"=>3, "name"=>"Dave"}]
    end
  end
end


