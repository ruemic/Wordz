require 'spec_helper'

describe Api::WordsController do
  let!(:word) { Word.create(name: "It's my word") }

  describe 'GET :index' do
    it 'should be success' do
      get :index, format: :json
      response.should be_success
    end
  end

  describe 'POST :create' do
    it 'creates new word' do
      expect {
        post :create, format: :json, word: {name: 'New word'}
      }.to change(Word, :count).by(1)
    end

    it 'response created' do
      post :create, format: :json, word: word.attributes
      response.status.should == 201
    end
  end

  describe 'PUT :update' do
    it 'updates word' do
      put :update, format: :json, id: word.id, word: {name: 'Updated word'}
      word.reload.name.should == 'Updated word'
    end

    it 'response no content' do
      put :update, format: :json, id: word.id, word: word.attributes
      response.status.should == 204
    end
  end

  describe 'DELETE :destroy' do
    it 'destroy word' do
      expect {
        delete :destroy, format: :json, id: word.id
      }.to change(Word, :count).by(-1)
    end

    it 'response no content' do
      delete :destroy, format: :json, id: word.id
      response.status.should == 204
    end
  end
end
