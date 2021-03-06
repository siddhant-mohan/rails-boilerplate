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

RSpec.describe MesAppointmentsController, :type => :controller do
  handle_session
  # This should return the minimal set of attributes required to create a valid
  # MesAppointment. As you add validations to MesAppointment, be sure to
  # adjust the attributes here as well.
  let(:mes_level) { FactoryGirl.create :mes_level }
  let(:cadre) { FactoryGirl.create :cadre }
  let(:trade) { FactoryGirl.create :trade }
  let(:mes_appointment_level) { FactoryGirl.create :mes_appointment_level }
  let(:mes_appointment) { FactoryGirl.create :mes_appointment, :mes_level_id => mes_level.id, :cadre_id => cadre.id, :trade_id => trade.id, :mes_appointment_level_id => mes_appointment_level.id}
  let(:valid_attributes) { FactoryGirl.attributes_for :mes_appointment, :mes_level_id => mes_level.id, :cadre_id => cadre.id, :trade_id => trade.id, :mes_appointment_level_id => mes_appointment_level.id}
  let(:invalid_attributes) { FactoryGirl.attributes_for :invalid_mes_appointment}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MesAppointmentsController. Be sure to keep this updated too.

  describe 'GET index' do
    context 'when authorized' do
      it 'assigns all mes_appointments as @mes_appointments' do
        assign_permission(:read, MesAppointment)
        mes_appointment = MesAppointment.create! valid_attributes
        get :index, {}
        expect(assigns(:mes_appointments)).to include(mes_appointment)
      end
      it 'renders the index template' do
        assign_permission(:read, MesAppointment)
        get :index
        expect(response).to render_template('index')
      end
    end
    context 'when not authorized' do
      it 'renders unauthorized' do
        revoke_permission(:read, MesAppointment)
        get :index, {}
        expect(response).to have_http_status(401)
      end
    end
  end


  describe 'GET show' do
    context 'when authorized' do
      it 'assigns the requested mes_appointment as @mes_appointment' do
        assign_permission(:read, MesAppointment)
        mes_appointment = MesAppointment.create! valid_attributes
        get :show, {:id => mes_appointment.to_param}
        expect(assigns(:mes_appointment)).to eq(mes_appointment)
      end
    end

    context 'when not authorized' do
      it 'renders unauthorized' do
        revoke_permission(:read, MesAppointment)
        mes_appointment = MesAppointment.create! valid_attributes
        get :show, {:id => mes_appointment.to_param}
        expect(response).to have_http_status(401)
      end
    end

  end

  describe 'GET new' do
    context 'when authorized' do
      it 'assigns a new mes_appointment as @mes_appointment' do
        assign_permission(:create, MesAppointment)
        get :new, {}
        expect(assigns(:mes_appointment)).to be_a_new(MesAppointment)
      end
    end

    context 'when not authorized' do
      it 'renders unauthorized' do
        revoke_permission(:create, MesAppointment)
        get :new, {}
        expect(response).to have_http_status(401)
      end
    end

  end

  describe "GET edit" do
    context 'when authorized' do
      it "assigns the requested mes_appointment as @mes_appointment" do
        assign_permission(:update, MesAppointment)
        mes_appointment = MesAppointment.create! valid_attributes
        get :edit, {:id => mes_appointment.to_param}
        expect(assigns(:mes_appointment)).to eq(mes_appointment)
      end
    end

    context 'when not unauthorized' do
      it "renders unauthorized " do
        revoke_permission(:update, MesAppointment)
        mes_appointment = MesAppointment.create! valid_attributes
        get :edit, {:id => mes_appointment.to_param}
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'POST create' do
    context 'when authorized' do
      before(:each) do
        assign_permission(:create, MesAppointment)
      end
      describe 'with valid params' do
        it 'creates a new MesAppointment' do
          expect {
            post :create, {:mes_appointment => valid_attributes}
          }.to change(MesAppointment, :count).by(1)
        end

        it 'assigns a newly created mes_appointment as @MesAppointment' do
          post :create, {:mes_appointment => valid_attributes}
          expect(assigns(:mes_appointment)).to be_a(MesAppointment)
        end

        it 'redirects to the created mes_appointment' do
          post :create, {:mes_appointment => valid_attributes}
          expect(response).to redirect_to(MesAppointment.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved mes_appointment as @mes_appointment' do
          post :create, {:mes_appointment => invalid_attributes}
          expect(assigns(:mes_appointment)).to be_a_new(MesAppointment)
        end

        it "re-renders the 'new' template" do
          post :create, {:mes_appointment => invalid_attributes}
          expect(response).to render_template('new')
        end
      end
    end
    context 'when not unauthorized ' do
      it 'renders unauthorized' do
        revoke_permission(:create, MesAppointment)
        expect {
          post :create, {:mes_appointment => valid_attributes}
        }.to change(MesAppointment, :count).by(0)
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'PUT update' do
    let(:new_attributes) { FactoryGirl.attributes_for :mes_appointment, :mes_level_id => mes_level.id, :cadre_id => cadre.id, :trade_id => trade.id, :mes_appointment_level_id => mes_appointment_level.id}

    context 'when authorized' do
      before(:each) do
        assign_permission(:update, MesAppointment)
      end
      describe 'with valid params' do

        it 'updates the requested mes_appointment' do
          mes_appointment = MesAppointment.create! valid_attributes
          put :update, {:id => mes_appointment.to_param, :mes_appointment => new_attributes}
          mes_appointment.reload
          expect(mes_appointment.name).to eq(new_attributes[:name])
        end

        it 'assigns the requested mes_appointment as @mes_appointment' do
          mes_appointment = MesAppointment.create! valid_attributes
          put :update, {:id => mes_appointment.to_param, :mes_appointment => valid_attributes}
          expect(assigns(:mes_appointment)).to eq(mes_appointment)
        end

        it 'redirects to the mes_appointment' do
          mes_appointment = MesAppointment.create! valid_attributes
          put :update, {:id => mes_appointment.to_param, :mes_appointment => valid_attributes}
          expect(response).to redirect_to(mes_appointment)
        end
      end

      describe 'with invalid params' do
        it 'assigns the mes_appointment as @mes_appointment' do
          mes_appointment = MesAppointment.create! valid_attributes
          put :update, {:id => mes_appointment.to_param, :mes_appointment => invalid_attributes}
          expect(assigns(:mes_appointment)).to eq(mes_appointment)
        end

        it "re-renders the 'edit' template" do
          mes_appointment = MesAppointment.create! valid_attributes
          put :update, {:id => mes_appointment.to_param, :mes_appointment => invalid_attributes}
          expect(response).to render_template('edit')
        end
      end
    end

    context 'when not unauthorized' do
      it 'renders unauthorized' do
        revoke_permission(:update, MesAppointment)
        mes_appointment = MesAppointment.create! valid_attributes
        put :update, {:id => mes_appointment.to_param, :mes_appointment => new_attributes}
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when authorized' do
      it 'destroys the requested mes_appointment' do
        assign_permission(:destroy, MesAppointment)
        mes_appointment = MesAppointment.create! valid_attributes
        expect {
          delete :destroy, {:id => mes_appointment.to_param}
        }.to change(MesAppointment, :count).by(-1)
      end

      it 'redirects to the mes_appointments list' do
        assign_permission(:destroy, MesAppointment)
        mes_appointment = MesAppointment.create! valid_attributes
        delete :destroy, {:id => mes_appointment.to_param}
        expect(response).to redirect_to(mes_appointments_url)
      end
    end
    context 'when not unauthorized' do
      it 'renders unauthorized' do
        revoke_permission(:destroy, MesAppointment)
        mes_appointment = MesAppointment.create! valid_attributes
        expect {
          delete :destroy, {:id => mes_appointment.to_param}
        }.to change(MesAppointment, :count).by(0)
        expect(response).to have_http_status(401)
      end
    end
  end
end
