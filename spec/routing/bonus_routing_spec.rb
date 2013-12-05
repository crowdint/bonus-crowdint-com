require 'spec_helper'

describe BonusesController do
  describe 'routing' do

    it 'routes to #index' do
      get('/bonuses').should route_to('bonuses#index')
    end

    it 'routes to #new' do
      get('/bonuses/new').should route_to('bonuses#new')
    end

    it 'routes to #show' do
      get('/bonuses/1').should route_to('bonuses#show', :id => '1')
    end

    it 'routes to #edit' do
      get('/bonuses/1/edit').should route_to('bonuses#edit', :id => '1')
    end

    it 'routes to #create' do
      post('/bonuses').should route_to('bonuses#create')
    end

    it 'routes to #update' do
      put('/bonuses/1').should route_to('bonuses#update', :id => '1')
    end

    it 'routes to #destroy' do
      delete('/bonuses/1').should route_to('bonuses#destroy', :id => '1')
    end

  end
end
