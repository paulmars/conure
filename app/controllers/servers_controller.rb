class ServersController < ApplicationController
  def index
    ec2 = Aws::EC2::Client.new(region: REGION)
    data = ec2.describe_instances()
    render text: date.to_json
  end

  def show
  end
end
