require 'rails_helper'
require 'rake'
describe "load CSV data" do
	before :all do
		load File.expand_path("../../../../lib/tasks/db_load.rake", __FILE__)
		Rake::Task.define_task(:environment)
	end

	it "loads all helps from csv to database" do
		help_csv_row_count=CSV.read("#{Rails.root}/db/data/help.csv", :headers => true).size
		Rake::Task['db:load_help'].invoke
		expect(Help.all.count).to eq(help_csv_row_count)
	end

	it "loads all Labels from csv to database" do
		label_csv_row_count=CSV.read("#{Rails.root}/db/data/label.csv", :headers => true).size
		Rake::Task['db:load_labels'].invoke
		expect(Label.all.count).to eq(label_csv_row_count)
	end

	it "loads all permissions from csv to database" do
		permission_csv_row_count=CSV.read("#{Rails.root}/db/data/permission.csv", :headers => true).size
		Rake::Task['db:load_permissions'].invoke
		expect(Permission.all.count).to eq(permission_csv_row_count)
	end

end
