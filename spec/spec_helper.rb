require 'bundler'
Bundler.require

require 'hatchet'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def deploy_app(name, &block)
    app = Hatchet::GitApp.new(
      name,
      buildpack_url: 'https://github.com/jtarchie/openresty-buildpack.git',
      stack: ENV['STACK'] || 'cedar-14'
    )

    app.deploy(&block)
  end
end
