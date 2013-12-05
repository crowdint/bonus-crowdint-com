require 'spec_helper'

describe 'Bonuses' do
  describe 'GET /bonuses' do
    login
    it 'working' do
      get bonuses_path
      response.status.should be(200)
    end
  end
end
