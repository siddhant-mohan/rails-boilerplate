# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

super_admin = User.create :email => 'mohan.siddhant2000@gmail.com', :password => 'super_admin', :firstname => 'Super',
													:lastname => 'Admin'
super_admin.save!

role = Role.create :name => 'admin', :description => 'powerfull admin'
role.save!

super_admin.roles << role

secret_code = SecretCode.create :code => 'dkjecsa'
secret_code.save!