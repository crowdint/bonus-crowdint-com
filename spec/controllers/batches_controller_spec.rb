require 'spec_helper'

describe BatchesController do
  login_user

  let(:valid_attributes) { { 'name' => 'MyString' } }

  describe 'GET index' do
    it 'assigns all batches as @batches' do
      batch = Batch.create! valid_attributes
      get :index, {}
      assigns(:batches).should eq([batch])
    end
  end

  describe 'GET show' do
    it 'assigns the requested batch as @batch' do
      batch = Batch.create! valid_attributes
      get :show, {:id => batch.to_param}
      assigns(:batch).should eq(batch)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Batch' do
        expect {
          post :create, {:batch => valid_attributes}
        }.to change(Batch, :count).by(1)
      end

      it 'assigns a newly created batch as @batch' do
        post :create, {:batch => valid_attributes}
        assigns(:batch).should be_a(Batch)
        assigns(:batch).should be_persisted
      end

      it 'redirects to the created batch' do
        post :create, {:batch => valid_attributes}
        response.status.should be(201)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved batch as @batch' do
        Batch.any_instance.stub(:save).and_return(false)
        post :create, {:batch => { 'name' => 'invalid value' }}
        assigns(:batch).should be_a_new(Batch)
      end

      it 're-renders the new template' do
        Batch.any_instance.stub(:save).and_return(false)
        post :create, {:batch => { 'name' => 'invalid value' }}
        response.status.should be(422)
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested batch' do
        batch = Batch.create! valid_attributes
        Batch.any_instance.should_receive(:update).with({ 'name' => 'MyString' })
        put :update, {:id => batch.to_param, :batch => { 'name' => 'MyString' }}
      end

      it 'assigns the requested batch as @batch' do
        batch = Batch.create! valid_attributes
        put :update, {:id => batch.to_param, :batch => valid_attributes}
        assigns(:batch).should eq(batch)
      end

      it 'redirects to the batch' do
        batch = Batch.create! valid_attributes
        put :update, {:id => batch.to_param, :batch => valid_attributes}
        response.status.should be(204)
      end
    end

    describe 'with invalid params' do
      it 'assigns the batch as @batch' do
        batch = Batch.create! valid_attributes
        Batch.any_instance.stub(:save).and_return(false)
        put :update, {:id => batch.to_param, :batch => { 'name' => 'invalid value' }}
        assigns(:batch).should eq(batch)
      end

      it 're-renders the edit template' do
        batch = Batch.create! valid_attributes
        Batch.any_instance.stub(:save).and_return(false)
        put :update, {:id => batch.to_param, :batch => { 'name' => 'invalid value' }}
        response.status.should be(422)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested batch' do
      batch = Batch.create! valid_attributes
      expect {
        delete :destroy, {:id => batch.to_param}
      }.to change(Batch, :count).by(-1)
    end

    it 'redirects to the batches list' do
      batch = Batch.create! valid_attributes
      delete :destroy, {:id => batch.to_param}
      response.status.should be(204)
    end
  end

end
