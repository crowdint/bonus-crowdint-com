require 'spec_helper'

describe 'Batches' do
  describe 'GET /batches' do
    login
    it 'working' do
      get batches_path
      response.status.should be(200)
    end
  end
end
