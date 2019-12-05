require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_templete :new
    end
  end

end

# RSpec.describe UsersController, type: :controller do

# end
