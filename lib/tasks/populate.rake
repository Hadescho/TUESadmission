# #encoding: UTF-8
# namespace :db  do
# 	desc "Populating the database with fake informatin in order to test"
# 	task populate: :environment do
# 		Record.delete_all # empty the Record database
# 		100.times do |i|
# 			Record.create({name:"Just another test #{i}",properties:{("Собствено име".to_sym): Faker::Name.first_name}})
# 		end

# 	end
	
# end