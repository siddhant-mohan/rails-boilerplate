require 'rails_helper'

RSpec.describe RolesController, :type => :controller do
	handle_session
	let(:permission1) {
		FactoryGirl.create :permission
	}
	let(:permission2) {
		FactoryGirl.create :permission
	}

	let(:role1) {
		attr = {:name => 'test_role', :description => 'test role'}
		Role.where(attr).first_or_create!
	}

	let(:role_permission) do
		{:role_id => role1.id, :permission_id => permission1.id}
	end

	let(:invalid_role_permission) do
		{:role_id => role1.id+100, :permission_id => permission1.id+100}
	end

	let(:role_permission_) do
		{:role_id => role1.id, :permission_id => permission1.id}
	end

	let(:valid_attributes) {
		FactoryGirl.attributes_for :role, :name => Faker::Lorem.word
	}
	let(:invalid_attributes) {
		FactoryGirl.attributes_for :invalid_role
	}

	describe 'Adding permission to role' do
		context 'when authorized' do
			before(:each) do
				assign_permission(:assign_permission, Role)
			end
			it 'Should assign a permission with valid attributes' do
				rc1 = role1.permissions.count
				post :assign_permission, role_permission
				role1.reload
				rc2 = role1.permissions.count
				expect(rc2).to eq(rc1+1)
			end

			it 'should not assign a duplicate permission ' do
				role1.permissions << permission1
				rc1 = role1.permissions.count
				post :assign_permission, role_permission
				role1.reload
				rc2 = role1.permissions.count
				expect(rc2).to eq(rc1)
			end

			it 'Should return status code 422 with invalid attributes' do
				post :assign_permission, invalid_role_permission
				expect(response).to have_http_status(:precondition_failed)
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:assign_permission, Role)
				rc1 = role1.permissions.count
				post :assign_permission, role_permission
				role1.reload
				rc2 = role1.permissions.count
				expect(rc2).to eq(rc1)
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'Removing permission from role' do
		context 'when authorized' do
			before(:each) do
				assign_permission(:revoke_permission, Role)
			end
			it 'Should remove a permission with valid attributes' do
				role1.permissions << permission1
				rc1 = role1.permissions.count
				post :revoke_permission, role_permission
				role1.reload
				rc2 = role1.permissions.count
				expect(rc2).to eq(rc1-1)
			end

			it 'Should return status code 422 with invalid attributes' do
				post :revoke_permission, invalid_role_permission
				expect(response).to have_http_status(:precondition_failed)
			end

			it 'Should not remove a nonexistent permission with valid attributes' do
				role1.permissions << permission1
				rc1 = role1.permissions.count
				post :revoke_permission, role_permission.merge(:permission_id => permission2.id)
				role1.reload
				rc2 = role1.permissions.count
				expect(rc2).to eq(rc1)
			end
		end

		context 'when not authorized' do
			it 'render unauthorized' do
				revoke_permission(:revoke_permission, Role)
				role1.permissions << permission1
				rc1 = role1.permissions.count
				post :revoke_permission, role_permission
				role1.reload
				rc2 = role1.permissions.count
				expect(rc2).to eq(rc1)
				expect(response).to have_http_status(401)
			end
		end

	end

	describe 'GET index' do
		context 'when authorized' do
			it 'assigns all roles as @roles' do
				assign_permission(:read, Role)
				role = role1
				get :index
				expect(assigns(:roles)).to include(role)
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:read, Role)
				get :index
				expect(assigns(:roles)).to eq([])
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'GET show' do
		context 'when authorized' do
			it 'assigns the requested role as @role' do
				assign_permission(:read, Role)
				role = role1
				get :show, {:id => role.to_param}
				expect(assigns(:role)).to eq(role)
				expect(response).to have_http_status(200)
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:read, Role)
				role = role1
				get :show, {:id => role.to_param}
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'GET new' do
		context 'when authorized' do
			it 'assigns a new role as @role' do
				assign_permission(:create, Role)
				get :new
				expect(assigns(:role)).to be_a_new(Role)
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:create, Role)
				get :new
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'GET edit' do
		context 'when authorized' do
			it 'assigns the requested role as @role' do
				assign_permission(:update, Role)
				role = role1
				get :edit, {:id => role.to_param}
				expect(assigns(:role)).to eq(role)
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:update, Role)
				role = role1
				get :edit, {:id => role.to_param}
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'POST create' do
		context 'when authorized' do
			before(:each) do
				assign_permission(:create, Role)
			end
			describe 'with valid params' do
				it 'creates a new Role' do
					expect {
						post :create, {:role => valid_attributes.merge(:name => 'role1')}
					}.to change(Role, :count).by(1)
				end

				it 'assigns a newly created role as @role' do
					post :create, {:role => valid_attributes.merge(:name => 'role2')}
					expect(assigns(:role)).to be_a(Role)
					expect(assigns(:role)).to be_persisted
				end

				it 'redirects to the created role' do
					post :create, {:role => valid_attributes.merge(:name => 'role3')}
					expect(response).to redirect_to(Role.last)
				end
			end

			describe 'with invalid params' do
				it 'assigns a newly created but unsaved role as @role' do
					post :create, {:role => invalid_attributes}
					expect(assigns(:role)).to be_a_new(Role)
				end

				it "re-renders the 'new' template" do
					post :create, {:role => invalid_attributes}
					expect(response).to render_template('new')
				end
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:create, Role)
				expect {
					post :create, {:role => valid_attributes}
				}.to change(Role, :count).by(0)
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'PUT update' do
		context 'when authorized' do
			before(:each) do
				assign_permission(:update, Role)
			end
			describe 'with valid params' do
				it 'updates the requested role' do
					new_attributes = valid_attributes.merge(:name => Faker::Lorem.word)
					role = role1
					put :update, {:id => role.to_param, :role => new_attributes}
					role.reload
					expect(role.name).to eq(new_attributes[:name])
				end

				it 'assigns the requested role as @role' do
					role = role1
					put :update, {:id => role.to_param, :role => valid_attributes}
					expect(assigns(:role)).to eq(role)
				end

				it 'redirects to the role' do
					role = role1
					put :update, {:id => role.to_param, :role => valid_attributes}
					expect(response).to redirect_to(role)
				end
			end

			describe 'with invalid params' do
				it 'assigns the role as @role' do
					role = role1
					put :update, {:id => role.to_param, :role => invalid_attributes}
					expect(assigns(:role)).to eq(role)
				end

				it "re-renders the 'edit' template" do
					role = role1
					put :update, {:id => role.to_param, :role => invalid_attributes}
					expect(response).to render_template('edit')
				end
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:update, Role)
				role = role1
				put :update, {:id => role.to_param, :role => valid_attributes}
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'DELETE destroy' do
		context 'when authorized' do
			it 'destroys the requested role' do
				assign_permission(:destroy, Role)
				role = FactoryGirl.create :role, :name => 'role4'
				expect {
					delete :destroy, {:id => role.to_param}
				}.to change(Role, :count).by(-1)
			end

			it 'redirects to the roles list' do
				assign_permission(:destroy, Role)
				role = FactoryGirl.create :role, :name => 'role6'
				delete :destroy, {:id => role.to_param}
				expect(response).to redirect_to(roles_url)
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:destroy, Role)
				role = role1
				expect {
					delete :destroy, {:id => role.to_param}
				}.to change(Role, :count).by(0)
				expect(response).to have_http_status(401)
			end
		end
	end
end
