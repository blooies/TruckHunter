require 'spec_helper'


describe AdminsController, :type => :controller do

	before :each do
		admin = Admin.create(username: "admin", password: "password")
		session[:admin] = true
	end

	describe 'GET #index' do
		it "it gets the index successfully" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #new' do
		it "renders the login page for admin" do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'POST #create' do
		it "if admin is authenticated, it redirects to admin's page" do
			post :create, {admin: {username: 'admin', password: 'password'}}

			expect(response).to redirect_to admins_page_path
		end
	end


	describe 'DELETE #destroy' do
		it "logs out and directs to homagepage" do
	    delete :destroy
			expect(response).to redirect_to root_path
		end
	end

end
