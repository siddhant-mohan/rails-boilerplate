require 'csv'
namespace :db do
	desc 'Load Permissions from CSV'
	task :load_permissions => :environment do
		CSV.foreach("#{Rails.root}/db/data/permission.csv", :headers => true) do |row|
			permission=Permission.where("action = ? AND subject = ?", row['action'], row['subject']).first
			if permission==nil
				Permission.create(:title => row['title'], :action => row['action'], :subject => row['subject'])
			else
				permission.update(:title => row['title'])
			end
		end
		puts 'Permissions loaded'
	end

	desc 'Permission from csv'
	task :load_all => [:load_permissions]

end
