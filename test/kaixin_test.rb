require File.join(File.dirname(__FILE__), '..', 'lib', 'oauth_china')

class Rails

  def self.root
    File.dirname(__FILE__)
  end

  def self.env
    'development'
  end

end

describe OauthChina do
  before(:each) do
    
  end

  it "should return a access token" do
    client = OauthChina::Kaixin.new
    authorize_url = client.authorize_url
    puts "Go to: #{authorize_url}"
    client.authorize(:oauth_verifier => gets)
  end
end

