class AppBaseModel < ActiveRecord::Base
	self.abstract_class = true

	def self.import_from_csv(csv_file_path)
		errors = []
		i=0
		CSV.foreach(csv_file_path, :headers => true) do |row|
			i+=1
			begin
				self.create! row.to_hash
			rescue Exception => e
				error = "#{e.message} at line #{i}"
				puts error
				errors << error
			end
		end
		errors
	end
end
