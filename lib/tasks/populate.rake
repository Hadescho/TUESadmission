#encoding: UTF-8
namespace :db  do
	desc "Populating the database with fake records in order to test and create a user"
	task populate: :environment do
		entry_number_counter = 0
		campaign = Campaign.create({name: "Sample campaign", record_type_id: 1})
		Record.delete_all # empty the Record database
		rec_type = RecordType.create({name: "test-type"})
		rec_type.fields<<RecordField.create({name:"Собствено име",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"Бащино име",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"Фамилно име",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"ЕГН",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"БЕЛ - училище",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"Физика - училище",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"Математика - изпит",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"Български - изпит",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"Математика - ТУЕС",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"Желание1",field_type: :text_field})
		rec_type.fields<<RecordField.create({name:"Желание2",field_type: :text_field})
		100.times do |i|
			first = (rand*2).to_i + 1
			 first == 1 ? second = 2 : second = 1 
			entry_number_counter += 1
			puts entry_number_counter
			campaign.records<< Record.create({campaign_id: 1,record_type_id: 1, entry_number: entry_number_counter, properties:{
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
		User.create(email:"test@test.com", password:"asdasdasd", password_confirmation: "asdasdasd")
	end
end 