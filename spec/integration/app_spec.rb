require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'shows a list of posts' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include 'First content'
      expect(response.body).to include 'Second content'
      expect(response.body).to include 'Thrid content'
    end

    it 'shows a form with textarea and submit button' do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include "<form method='POST' action='/new-post'>"
      expect(response.body).to include '<textarea name="new_post_content" rows="4" cols="50">What\'s happening?</textarea>'        
      expect(response.body).to include '<input type="submit">'
    end
  end

end
