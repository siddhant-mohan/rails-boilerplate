require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe StatesController, :type => :controller do
	handle_session
	# This should return the minimal set of attributes required to create a valid
	# State. As you add validations to State, be sure to
	# adjust the attributes here as well.
	let(:country) { FactoryGirl.create :country }
	let(:state) { FactoryGirl.create :state, :country_id => country.id }
	let(:valid_attributes) { FactoryGirl.attributes_for :state, :country_id => country.id}
	let(:invalid_attributes) { FactoryGirl.attributes_for :invalid_state}

	# This should return the minimal set of values that should be in the session
	# in order to pass any filters (e.g. authentication) defined in
	# StatesController. Be sure to keep this updated too.

	describe 'GET index' do
		context 'when authorized' do
			it 'assigns all states as @states' do
				assign_permission(:read, State)
				state = State.create! valid_attributes
				get :index, {}
				expect(assigns(:states)).to include(state)
			end
			it 'renders the index template' do
				assign_permission(:read, State)
				get :index
				expect(response).to render_template('index')
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:read, State)
				get :index, {}
				expect(response).to have_http_status(401)
			end
		end
	end


	describe 'GET show' do
		context 'when authorized' do
			it 'assigns the requested state as @state' do
				assign_permission(:read, State)
				state = State.create! valid_attributes
				get :show, {:id => state.to_param}
				expect(assigns(:state)).to eq(state)
			end
		end

		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:read, State)
				state = State.create! valid_attributes
				get :show, {:id => state.to_param}
				expect(response).to have_http_status(401)
			end
		end

	end

	describe 'GET new' do
		context 'when authorized' do
			it 'assigns a new state as @state' do
				assign_permission(:create, State)
				get :new, {}
				expect(assigns(:state)).to be_a_new(State)
			end
		end

		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:create, State)
				get :new, {}
				expect(response).to have_http_status(401)
			end
		end

	end

	describe "GET edit" do
		context 'when authorized' do
			it "assigns the requested state as @state" do
				assign_permission(:update, State)
				state = State.create! valid_attributes
				get :edit, {:id => state.to_param}
				expect(assigns(:state)).to eq(state)
			end
		end

		context 'when not unauthorized' do
			it "renders unauthorized " do
				revoke_permission(:update, State)
				state = State.create! valid_attributes
				get :edit, {:id => state.to_param}
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'POST create' do
		context 'when authorized' do
			before(:each) do
				assign_permission(:create, State)
			end
			describe 'with valid params' do
				it 'creates a new State' do
					expect {
						post :create, {:state => valid_attributes}
					}.to change(State, :count).by(1)
				end

				it 'assigns a newly created state as @State' do
					post :create, {:state => valid_attributes}
					expect(assigns(:state)).to be_a(State)
				end

				it 'redirects to the created state' do
					post :create, {:state => valid_attributes}
					expect(response).to redirect_to(State.last)
				end
			end

			describe 'with invalid params' do
				it 'assigns a newly created but unsaved state as @state' do
					post :create, {:state => invalid_attributes}
					expect(assigns(:state)).to be_a_new(State)
				end

				it "re-renders the 'new' template" do
					post :create, {:state => invalid_attributes}
					expect(response).to render_template('new')
				end
			end
		end
		context 'when not unauthorized ' do
			it 'renders unauthorized' do
				revoke_permission(:create, State)
				expect {
					post :create, {:state => valid_attributes}
				}.to change(State, :count).by(0)
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'PUT update' do
		let(:new_attributes) { FactoryGirl.attributes_for :state, :country_id => country.id}

		context 'when authorized' do
			before(:each) do
				assign_permission(:update, State)
			end
			describe 'with valid params' do

				it 'updates the requested state' do
					state = State.create! valid_attributes
					put :update, {:id => state.to_param, :state => new_attributes}
					state.reload
					expect(state.name).to eq(new_attributes[:name])
				end

				it 'assigns the requested state as @state' do
					state = State.create! valid_attributes
					put :update, {:id => state.to_param, :state => valid_attributes}
					expect(assigns(:state)).to eq(state)
				end

				it 'redirects to the state' do
					state = State.create! valid_attributes
					put :update, {:id => state.to_param, :state => valid_attributes}
					expect(response).to redirect_to(state)
				end
			end

			describe 'with invalid params' do
				it 'assigns the state as @state' do
					state = State.create! valid_attributes
					put :update, {:id => state.to_param, :state => invalid_attributes}
					expect(assigns(:state)).to eq(state)
				end

				it "re-renders the 'edit' template" do
					state = State.create! valid_attributes
					put :update, {:id => state.to_param, :state => invalid_attributes}
					expect(response).to render_template('edit')
				end
			end
		end

		context 'when not unauthorized' do
			it 'renders unauthorized' do
				revoke_permission(:update, State)
				state = State.create! valid_attributes
				put :update, {:id => state.to_param, :state => new_attributes}
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'DELETE destroy' do
		context 'when authorized' do
			it 'destroys the requested state' do
				assign_permission(:destroy, State)
				state = State.create! valid_attributes
				expect {
					delete :destroy, {:id => state.to_param}
				}.to change(State, :count).by(-1)
			end

			it 'redirects to the states list' do
				assign_permission(:destroy, State)
				state = State.create! valid_attributes
				delete :destroy, {:id => state.to_param}
				expect(response).to redirect_to(states_url)
			end
		end
		context 'when not unauthorized' do
			it 'renders unauthorized' do
				revoke_permission(:destroy, State)
				state = State.create! valid_attributes
				expect {
					delete :destroy, {:id => state.to_param}
				}.to change(State, :count).by(0)
				expect(response).to have_http_status(401)
			end
		end
	end
end