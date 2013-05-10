#encoding: UTF-8
namespace :db  do
	desc "Populating the database with fake informatin in order to test"
	task populate: :environment do
		campaign = Campaign.create({name: "Sample campaign"})
		Record.delete_all # empty the Record database
		rec_type = RecordType.create({name: "test-type"})
		100.times do |i|
			first = (rand*2).to_i + 1
			 first == 1 ? second = 2 : second = 1 

			campaign.records<< Record.create({campaign_id: 1,record_type_id: 1, properties:{
				("Собствено име".to_sym) => Faker::Name.first_name,
				("Бащино име".to_sym) => Faker::Name.first_name,
				("Фамилно име".to_sym) => Faker::Name.last_name,
				("ЕГН".to_sym) => rand(10 ** 10),
				("БЕЛ - училище".to_sym) => (rand()*4+2).round(4),
				("Физика - училище".to_sym) => (rand()*4+2).round(4),
				("Математика - изпит".to_sym) => (rand()*4+2).round(4),
				("Български - изпит".to_sym) => (rand()*4+2).round(4),
				("Математика - ТУЕС".to_sym) => (rand()*4+2).round(4),
				("Желание1".to_sym) => first,
				("Желание2".to_sym) => second
			}})
		end
	end
end