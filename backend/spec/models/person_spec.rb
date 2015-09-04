require 'rails_helper'

RSpec.describe Person, :type => :model do
	it { is_expected.to respond_to :service_no }
	it { is_expected.to respond_to :name }
	it { is_expected.to respond_to :birth_place }
	it { is_expected.to respond_to :gpf_account_no }
	it { is_expected.to respond_to :dob }
	it { is_expected.to respond_to :cda_account_no }
	it { is_expected.to respond_to :id_card_no }
	it { is_expected.to respond_to :dob_remark }
	it { is_expected.to respond_to :pan_no }
	it { is_expected.to respond_to :dob_change_count }
	it { is_expected.to respond_to :passport_details }
	it { is_expected.to respond_to :will_executed }
	it { is_expected.to respond_to :previous_occupation }
	it { is_expected.to respond_to :service_book_no }
	it { is_expected.to respond_to :service_book_audited_upto }
	it { is_expected.to respond_to :qualifying_due_date }
	it { is_expected.to respond_to :qualifying_actual_date }
	it { is_expected.to respond_to :qualifying_authority }
	it { is_expected.to respond_to :non_effective_date }
	it { is_expected.to respond_to :non_effective_remarks }
	it { is_expected.to respond_to :likely_non_effective_date }
	it { is_expected.to respond_to :blc_issued_date }
	it { is_expected.to respond_to :pran_no }
	it { is_expected.to respond_to :neg_no }
	it { is_expected.to respond_to :handicap_details }
	it { is_expected.to respond_to :handicap_restrictions }
	it { is_expected.to respond_to :percentage_disability }
	it { is_expected.to respond_to :handicap_year }
	it { is_expected.to respond_to :handicap_remarks }
	it { is_expected.to respond_to :s }
	it { is_expected.to respond_to :h }
	it { is_expected.to respond_to :p }
	it { is_expected.to respond_to :a }
	it { is_expected.to respond_to :e }
	it { is_expected.to respond_to :medical_remarks }
	it { is_expected.to respond_to :created_at }
	it { is_expected.to respond_to :updated_at }
	it { is_expected.to respond_to :will_execution_location }
	it { is_expected.to respond_to :banker_details }
	it { is_expected.to respond_to :permanent_address_change_count }
	it { is_expected.to respond_to :dcrg }
	it { is_expected.to respond_to :agif }
	it { is_expected.to respond_to :dsop }
	it { is_expected.to respond_to :training_establishment_id }
	it { is_expected.to respond_to :current_appointment_id }
	it { is_expected.to respond_to :home_address_id }
	it { is_expected.to respond_to :permanent_address_id }
	it { is_expected.to respond_to :permanent_address_remark }
	it { is_expected.to respond_to :nationality_id }
	it { is_expected.to respond_to :mother_tongue_id }
	it { is_expected.to respond_to :spouse_id }
	it { is_expected.to respond_to :caste_id }
	it { is_expected.to respond_to :caste_remarks }
	it { is_expected.to respond_to :marital_status_id }
	it { is_expected.to respond_to :regiment_id }
	it { is_expected.to respond_to :commission_type_id }
	it { is_expected.to respond_to :employee_group_id }
	it { is_expected.to respond_to :engg_group_id }
	it { is_expected.to respond_to :military_level_id }
	it { is_expected.to respond_to :handicap_type_id }
	it { is_expected.to respond_to :religion_id }
	it { is_expected.to respond_to :type_of_entry }
	it { is_expected.to respond_to :gender }
	it { is_expected.to respond_to :person_type }
	it { is_expected.to respond_to :employee_type }
	it { is_expected.to respond_to :fitness }
	it { is_expected.to respond_to :handicap_type}
	it { is_expected.to respond_to :religion}
	it { is_expected.to respond_to :caste}
	it { is_expected.to respond_to :engg_group}
	it { is_expected.to respond_to :employee_group}
	it { is_expected.to respond_to :mil_commission_type}
	it { is_expected.to respond_to :regiment}
	it { is_expected.to respond_to :marital_status}
	it { is_expected.to respond_to :nationality}
	it { is_expected.to validate_presence_of(:service_no) }
	it { is_expected.to validate_uniqueness_of(:service_no) }
	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_presence_of(:person_type) }
end
