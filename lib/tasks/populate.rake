#encoding: UTF-8
namespace :db  do
	desc "Populating the database with fake informatin in order to test"
	task populate: :environment do
		campaign = Campaign.first
		Record.delete_all # empty the Record database
		100.times do |i|
			campaign.records<< Record.create({campaign_id: 1,record_type_id: 3, properties:{("Собствено име".to_sym) => Faker::Name.first_name,("Бащино име".to_sym) => Faker::Name.first_name, ("Фамилно име".to_sym) => Faker::Name.last_name, ("ЕГН".to_sym) => rand(10 ** 10).to_s, ("Математика - училище".to_sym) => (rand()*4+2).to_s, ("Физика - училище".to_sym) => (rand()*4+2).to_s, ("Математика - изпит".to_sym) => (rand()*4+2).to_s,("Български - изпит".to_sym) => (rand()*4+2).to_s }})
		end
	end
end