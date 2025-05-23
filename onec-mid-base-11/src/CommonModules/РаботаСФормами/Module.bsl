#Область СлужебныйПрограммныйИнтерфейс

Процедура ДополнитьФорму(Форма) Экспорт
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		ДобавитьПолеСогласованнаяСкидкаИКнопкаПересчитатьТаблицу(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);	
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);	
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);	
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);	
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ПрограммныйИнтерфейс

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма)
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ДобавитьПолеСогласованнаяСкидкаИКнопкаПересчитатьТаблицу(Форма)
	
	Группа = Форма.Элементы.Добавить("ГруппаСкидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа; 
	Группа.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда; 
	Группа.ОтображатьЗаголовок = Ложь;
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаСкидка);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДЗ_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "ДЗ_СогласованнаяСкидкаПриИзменении");
	
	Команда = Форма.Команды.Добавить("ДЗ_ПересчитатьТаблицу");
	Команда.Заголовок = "Пересчитать таблицу";
	Команда.Действие = "ДЗ_ПересчитатьТаблицу";
	
	Кнопка = Форма.Элементы.Добавить("Пересчитать", Тип("КнопкаФормы"), Форма.Элементы.ГруппаСкидка);
	Кнопка.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	Кнопка.ИмяКоманды = "ДЗ_ПересчитатьТаблицу";  
	Кнопка.Отображение = ОтображениеКнопки.КартинкаИТекст;
	Кнопка.Картинка = БиблиотекаКартинок.Обновить;
	
КонецПроцедуры

#КонецОбласти