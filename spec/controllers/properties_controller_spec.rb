require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do

  describe 'POST #create' do

    let!(:user) { create(:user) }

    context 'with valid attributes' do
      it 'creates the property' do
        post :create, property: attributes_for(:property)
        expect(Property.count).to eq(1)
      end

      it 'redirects to the "show" action for the new property' do
        post :create, property: attributes_for(:property)
        expect(response).to redirect_to Property.first
      end
    end

    context 'with invalid attributes' do
      it 'does not create the property' do
        post :create, property: attributes_for(:property, description: nil)
        expect(Property.count).to eq(0)
      end

      it 're-renders the "new" view' do
        post :create, property: attributes_for(:property, description: nil)
        expect(response).to render_template(:new)
      end
    end
  end

  context 'DELETE #destroy' do
    it 'removes property' do

      expect(Property.count).to eq(0)
    end
  end

end
