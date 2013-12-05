require 'spec_helper'

describe OrganizationsController do
  login_user

  let(:valid_attributes) { { 'name' => 'MyString' } }

  describe 'GET index' do
    it 'assigns all organizations as @organizations' do
      organization = Organization.create! valid_attributes
      get :index, {}
      assigns(:organizations).should eq([organization])
    end
  end

  describe 'GET show' do
    it 'assigns the requested organization as @organization' do
      organization = Organization.create! valid_attributes
      get :show, {:id => organization.to_param}
      assigns(:organization).should eq(organization)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Organization' do
        expect {
          post :create, {:organization => valid_attributes}
        }.to change(Organization, :count).by(1)
      end

      it 'assigns a newly created organization as @organization' do
        post :create, {:organization => valid_attributes}
        assigns(:organization).should be_a(Organization)
        assigns(:organization).should be_persisted
      end

      it 'redirects to the created organization' do
        post :create, {:organization => valid_attributes}
        response.status.should be(201)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved organization as @organization' do
        Organization.any_instance.stub(:save).and_return(false)
        post :create, {:organization => { 'name' => 'invalid value' }}
        assigns(:organization).should be_a_new(Organization)
      end

      it 're-renders the new template' do
        Organization.any_instance.stub(:save).and_return(false)
        post :create, {:organization => { 'name' => 'invalid value' }}
        response.status.should be(422)
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested organization' do
        organization = Organization.create! valid_attributes
        Organization.any_instance.should_receive(:update).with({ 'name' => 'MyString' })
        put :update, {:id => organization.to_param, :organization => { 'name' => 'MyString' }}
      end

      it 'assigns the requested organization as @organization' do
        organization = Organization.create! valid_attributes
        put :update, {:id => organization.to_param, :organization => valid_attributes}
        assigns(:organization).should eq(organization)
      end

      it 'redirects to the organization' do
        organization = Organization.create! valid_attributes
        put :update, {:id => organization.to_param, :organization => valid_attributes}
        response.status.should be(204)
      end
    end

    describe 'with invalid params' do
      it 'assigns the organization as @organization' do
        organization = Organization.create! valid_attributes
        Organization.any_instance.stub(:save).and_return(false)
        put :update, {:id => organization.to_param, :organization => { 'name' => 'invalid value' }}
        assigns(:organization).should eq(organization)
      end

      it 're-renders the edit template' do
        organization = Organization.create! valid_attributes
        Organization.any_instance.stub(:save).and_return(false)
        put :update, {:id => organization.to_param, :organization => { 'name' => 'invalid value' }}
        response.status.should be(422)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested organization' do
      organization = Organization.create! valid_attributes
      expect {
        delete :destroy, {:id => organization.to_param}
      }.to change(Organization, :count).by(-1)
    end

    it 'redirects to the organizations list' do
      organization = Organization.create! valid_attributes
      delete :destroy, {:id => organization.to_param}
      response.status.should be(204)
    end
  end

end
