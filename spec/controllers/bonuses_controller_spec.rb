require 'spec_helper'

describe BonusesController do

  let(:valid_attributes) { { 'message' => 'MyString' } }

  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all bonus as @bonus' do
      bonus = Bonus.create! valid_attributes
      get :index, {}, valid_session
      assigns(:bonuses).should eq([bonus])
    end
  end

  describe 'GET show' do
    it 'assigns the requested bonus as @bonus' do
      bonus = Bonus.create! valid_attributes
      get :show, {:id => bonus.to_param}, valid_session
      assigns(:bonus).should eq(bonus)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Bonus' do
        expect {
          post :create, {:bonus => valid_attributes}, valid_session
        }.to change(Bonus, :count).by(1)
      end

      it 'assigns a newly created bonus as @bonus' do
        post :create, {:bonus => valid_attributes}, valid_session
        assigns(:bonus).should be_a(Bonus)
        assigns(:bonus).should be_persisted
      end

      it 'redirects to the created bonus' do
        post :create, {:bonus => valid_attributes}, valid_session
        response.status.should be(201)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved bonus as @bonus' do
        Bonus.any_instance.stub(:save).and_return(false)
        post :create, {:bonus => { 'message' => 'invalid value' }}, valid_session
        assigns(:bonus).should be_a_new(Bonus)
      end

      it 're-renders the new template' do
        Bonus.any_instance.stub(:save).and_return(false)
        post :create, {:bonus => { 'message' => 'invalid value' }}, valid_session
        response.status.should be(422)
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested bonus' do
        bonus = Bonus.create! valid_attributes
        Bonus.any_instance.should_receive(:update).with({ 'message' => 'MyString' })
        put :update, {:id => bonus.to_param, :bonus => { 'message' => 'MyString' }}, valid_session
      end

      it 'assigns the requested bonus as @bonus' do
        bonus = Bonus.create! valid_attributes
        put :update, {:id => bonus.to_param, :bonus => valid_attributes}, valid_session
        assigns(:bonus).should eq(bonus)
      end

      it 'redirects to the bonus' do
        bonus = Bonus.create! valid_attributes
        put :update, {:id => bonus.to_param, :bonus => valid_attributes}, valid_session
        response.status.should be(204)
      end
    end

    describe 'with invalid params' do
      it 'assigns the bonus as @bonus' do
        bonus = Bonus.create! valid_attributes
        Bonus.any_instance.stub(:save).and_return(false)
        put :update, {:id => bonus.to_param, :bonus => { 'message' => 'invalid value' }}, valid_session
        assigns(:bonus).should eq(bonus)
      end

      it 're-renders the edit template' do
        bonus = Bonus.create! valid_attributes
        Bonus.any_instance.stub(:save).and_return(false)
        put :update, {:id => bonus.to_param, :bonus => { 'message' => 'invalid value' }}, valid_session
        response.status.should be(422)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested bonus' do
      bonus = Bonus.create! valid_attributes
      expect {
        delete :destroy, {:id => bonus.to_param}, valid_session
      }.to change(Bonus, :count).by(-1)
    end

    it 'redirects to the bonus list' do
      bonus = Bonus.create! valid_attributes
      delete :destroy, {:id => bonus.to_param}, valid_session
      response.status.should be(204)
    end
  end

end
