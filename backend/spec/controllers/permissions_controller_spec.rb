require 'rails_helper'

RSpec.describe PermissionsController, :type => :controller do
	describe "GET index" do
		handle_session
		let(:new_permission){
			FactoryGirl.create(:permission)
		}
		context 'when permitted' do
			it 'returns permissions' do
				assign_permission(:read, Permission)
				permission = new_permission
				get :index
				expect(assigns(:permissions)).to include(permission)
			end
		end
		context 'when not permitted' do
			it 'renders unauthorized' do
				revoke_permission(:read, Permission)
				get :index
				expect(assigns(:permissions)).to eq(nil)
				expect(response).to have_http_status(401)
			end
		end
	end
end
