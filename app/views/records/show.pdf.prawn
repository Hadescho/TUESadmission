pdf.font "lib/arial.ttf"

rotate(90)

line [350,-50], [350,-700]
stroke

bounding_box([180, -50], :width => 150, :height => 60) do
	#transparent(0.5) { stroke_bounds }
	font_size 10
	pdf.text "До", :character_spacing => 0
	pdf.text "Ректора", :character_spacing => 0
	pdf.text "на Технически Университет", :character_spacing => 0
	pdf.text "гр. София", :character_spacing => 0
end

bounding_box([0,-50], :width => 150, :height => 60) do
	#transparent(0.5) { stroke_bounds }
	font_size 12
	pdf.text "Входящ номер #{@record.entry_number}"
end

bounding_box([80, -130], :width => 330, :height => 20) do
	font_size 18
	pdf.text "ЗАЯВЛЕНИЕ", :character_spacing => 0
end

bounding_box([0, -160], :width => 330, :height => 240) do
	#transparent(0.5) { stroke_bounds }
	font_size 8

	pdf.text "от #{@record.properties["Собствено име".to_sym]} #{@record.properties["Бащино име".to_sym]} #{@record.properties["Фамилно име".to_sym]}", :character_spacing => 0
	pdf.text "ученик (ученичка) от VII клас за учебната 2013/2014 г. на училище: #{@record.properties["Училище".to_sym]}", :character_spacing => 0
	pdf.text "живеещ(настоящ адрес): #{@record.properties["Адрес".to_sym]}", :character_spacing => 0
	
	move_down 10
	
	pdf.text "Г-н Ректор,", :character_spacing => 0
	pdf.text "Желая да бъда допуснат(а) до състезателен изпит по математика и кандидатстване в Технологично училище \"Електронни системи\" (ТУЕС) към Технически университет София.", :character_spacing => 0, :align => :justify
	
	move_down 10
	
	pdf.text "Прилагам следните документи:", :character_spacing => 0
	
	move_down 10
	
	pdf.text "1 - Копие на медицинското свидетелство с отразено цветоусещане и диоптри."
	pdf.text "2 - Две снимки от настоящата година."
	pdf.text "3 - Копие на първата страница на ученическия бележник за 7. клас през учебната 2013/2014г."

	move_down 10

	pdf.text "Заявявам желания за подредба на специалностите при класирането:"
	
	move_down 10

	pdf.text "1.СП (Системно програмиране)" 
	pdf.text "2.КМ (Компютърни мрежи)"
end

bounding_box([0, -410], :width => 330, :height => 50) do
	#transparent(0.5) { stroke_bounds }
	
	move_down font.height
	
	font_size 8
	
	pdf.text "Връзка с родител(настойник): #{@record.properties["Имена на родител".to_sym]}", :character_spacing => 0

	pdf.text "дом. тел. #{@record.properties["Домашен телефон".to_sym]}    моб. тел. #{@record.properties["Мобилен телефон".to_sym]}   e-mail : #{@record.properties["Мейл".to_sym]}", :character_spacing => 0 
end

bounding_box([0, -470], :width => 330, :height => 110) do
	#transparent(0.5) { stroke_bounds }

	font_size 8
	pdf.text "гр.София, #{Date.today}     Подпис(на ученика или родителя): ............................"

	move_down 10

	font_size 6
	pdf.text "Забележка: С подписа си удостоверявам, коректността и достоверността на подадените/въведените данни."
end

bounding_box([370, -50], :width => 330, :height => 30) do
	#transparent(0.5) { stroke_bounds }
	font_size 12
	pdf.text "Технологично училище „Електронни системи”", :align => :center
	pdf.text "към Техническия университет - София", :align => :center
end

bounding_box([370, -90], :width => 330, :height => 220) do
	#transparent(0.5) { stroke_bounds }
	
	bounding_box([10, 200], :width => 120, :height => 150) do
		transparent(0.5) { stroke_bounds }
	end

	bounding_box([200, 200], :width => 180, :height => 150) do
		#transparent(0.5) { stroke_bounds }
		font_size 12
		pdf.text "Входящ №: #{@record.entry_number}"
		move_down 10
		pdf.text "Име: #{@record.properties["Собствено име".to_sym]}"
		move_down 10
		pdf.text "Презиме: #{@record.properties["Бащино име".to_sym]}"
		move_down 10
		pdf.text "Фамилия: #{@record.properties["Фамилно име".to_sym]}"
		move_down 10
	end

	bounding_box([10, 10], :width => 300, :height => 40) do
		#transparent(0.5) { stroke_bounds }
		font_size 8
		pdf.text "Приемен изпит : 31.05.2014 г. Местата се заемат до 7:30 ч."
		pdf.text "Настоящият талон служи за вход в залата за изпита."
		pdf.text "Задължително го носете! В противен случай ученикът няма да бъде допуснат до изпита."
	end
end

line [350,-350], [750,-350]
stroke

bounding_box([370, -360], :width => 330, :height => 40) do
	#transparent(0.5) { stroke_bounds }
	font_size 12
	pdf.text "Технологично училище „Електронни системи”", :align => :center
	pdf.text "към Техническия университет - София", :align => :center
end

bounding_box([380, -410], :width => 330, :height => 150) do
	#transparent(0.5) { stroke_bounds }
	font_size 8
	pdf.text "Ученикът #{@record.properties["Собствено име".to_sym]} #{@record.properties["Бащино име".to_sym]} #{@record.properties["Фамилно име".to_sym]} със входящ номер: #{@record.entry_number}, подаде заявление за състезателен изпит по математика и кандидатстване в Технологично училище „Електронни системи” към Техническия университет – София и заяви  следните желания за подредба на специалностите при класирането:", :align => :justify

	move_down 10

	font_size 10
	pdf.text "1. СП (Системно програмиране)"
	pdf.text "2. КМ (Компютърни мрежи)"

	move_down 10

	font_size 8
	pdf.text "Изпитът е на 31 май 2014 г. в учебна зала на ТУ – София. Проверете номера на залата на страницата на ТУЕС (www.elsys-bg.org) или на информационното табло в сградата на училището на 29 май 2014 г. след 18 часа.", :align => :justify
end

bounding_box([380, -570], :width => 330, :height => 100) do
	#transparent(0.5) { stroke_bounds }

	font_size 8
	pdf.text "гр.София, #{Date.today}                Приел документите: ............................"

	move_down 10

	font_size 6
	pdf.text "Забележка: Този отрязък се дава на ученика и е информативен"
end


