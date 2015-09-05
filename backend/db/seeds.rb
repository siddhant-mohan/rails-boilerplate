# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

super_admin = User.create :email => 'mohan.siddhant2000@gmail.com', :password => 'super_admin', :firstname => 'Super',
													:lastname => 'Admin', :status=>:active , :uid => 'superadmin'
super_admin.save!


def seed_from_csv(model)
	csv_file_name = model.to_s.underscore
	path = "#{Rails.root}/db/data/#{csv_file_name}.csv"
	model.import_from_csv path
end

all_models = [Permission]

all_models.each do |model|
	seed_from_csv model
end
