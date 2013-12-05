require 'spec_helper'

describe 'Organizations' do
  describe 'GET /organizations' do
    it 'working' do
      get organizations_path
      response.status.should be(200)
    end
  end
end
