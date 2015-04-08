class ServersController < ApplicationController
  def index
    region = 'us-east-1'

    key = ENV["CONURE_KEY"]
    secret = ENV["CONURE_SECRET"]

    cred = Aws::Credentials.new(key, secret)

    Aws.config.update({
      region: region,
      credentials: cred,
    })

    ec2 = Aws::EC2::Client.new(region: region)
    data = ec2.describe_instances()

    render text: data.to_json
  end

  def show
  end
end
