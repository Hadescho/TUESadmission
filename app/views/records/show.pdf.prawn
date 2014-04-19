pdf.font "lib/DejaVuSans.ttf"

rotate(90)

line [350,-50], [350,-700]
stroke

bounding_box([180, -50], :width => 150, :height => 60) do
	transparent(0.5) { stroke_bounds }
	font_size 10
	pdf.text "До", :character_spacing => 0
	pdf.text "Ректора", :character_spacing => 0
	pdf.text "на Технически Университет", :character_spacing => 0
	pdf.text "гр. София", :character_spacing => 0
end

bounding_box([0, -120], :width => 330, :height => 110) do
	transparent(0.5) { stroke_bounds }
	font_size 12
	pdf.text "Входящ номер #{@record.entry_number}"
	move_down font.height
	font_size 8
	pdf.text "Връзка с родител(настойник):", :character_spacing => 0
	pdf.text "Пешо Петров Петров", :character_spacing => 0
	pdf.text "дом. тел.", :character_spacing => 0 
	pdf.text "12 34567"
	pdf.text "моб. тел.", :character_spacing => 0
	pdf.text "0123456789" 
	pdf.text "e-mail : test@test.com"
end

bounding_box([80, -240], :width => 330, :height => 20) do
	font_size 18
	pdf.text "ЗАЯВЛЕНИЕ", :character_spacing => 0
end

bounding_box([0, -270], :width => 330, :height => 210) do
	transparent(0.5) { stroke_bounds }
	font_size 8

	pdf.text "от #{@record.name}", :character_spacing => 0
	pdf.text "ученик/чка от VII клас на училище", :character_spacing => 0
	pdf.text "живеещ(настоящ адрес): адрес", :character_spacing => 0
	
	move_down 10
	
	pdf.text "Г-н Ректор,", :character_spacing => 0
	pdf.text "Желая да бъда допуснат(а) до състезателен изпит по математика и кандидатстване в Технологично училище \"Електронни системи\" (ТУЕС) към Технически университет София.", :character_spacing => 0
	
	move_down 10
	
	pdf.text "Прилагам следните документи:", :character_spacing => 0
	
	move_down 10
	
	pdf.text "1 - Ксерокопие на медицинското свидетелство с отразено цветоусещане и диоптри."
	pdf.text "2 - Две снимки от настоящата година."
	pdf.text "3 - Ксерокопие на първата страница на ученическия бележник за 7. клас."

	move_down 10

	pdf.text "Заявявам желания за подредба на специалностите при класирането:"
	
	move_down 10

	pdf.text "1.СП" 
	pdf.text "2.КМ"
end

bounding_box([0, -490], :width => 330, :height => 200) do
	transparent(0.5) { stroke_bounds }
	
	font_size 6
	pdf.text "Забележка: С подписа си удостоверявам, коректността и достоверността на подадените/въведените данни."

	move_down 10

	font_size 8
	pdf.text "гр.София, #{Time.now}"

	move_down 10

	pdf.text "Подпис(на ученика или родителя): ..............................."

	move_down 10

	pdf.text "Приел документите(име и подпис): ..............................."
end

bounding_box([370, -50], :width => 330, :height => 10) do
	transparent(0.5) { stroke_bounds }
	font_size 9
	pdf.text "ТЕХНОЛОГИЧНО УЧИЛИЩЕ ЕЛЕКТРОННИ СИСТЕМИ към ТУ - СОФИЯ"
end
gap = 20
bounding_box([370, -70], :width => 330, :height => 220) do
	transparent(0.5) { stroke_bounds }
	
	bounding_box([10, 200], :width => 120, :height => 150) do
		transparent(0.5) { stroke_bounds }
		pdf.text "Снимка на"
		pdf.text "ученика."
	end

	bounding_box([140, 200], :width => 180, :height => 150) do
		transparent(0.5) { stroke_bounds }
		font_size 12
		pdf.text "Входящ №: "
		move_down 5
		pdf.text "Име: "
		move_down 5
		pdf.text "Презиме: "
		move_down 5
		pdf.text "Фамилия: "
		move_down 5
		pdf.text "Моля носете настоящия картон на изпита."
	end

	bounding_box([10, 40], :width => 300, :height => 20) do
		transparent(0.5) { stroke_bounds }
		pdf.text "Местата се заемат до 7,45 часа."
	end
end




