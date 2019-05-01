# All inputs and puts

class Interface
  attr_reader :input_code, :answer

  def continue
    puts 'Хотите продолжит? y/n'
    @answer = gets.chomp
  end

  def end
    puts 'Спасибо за покупку! Ждем Вас снова.'
    exit
  end

  def error
    puts 'Что-то пошло не так. Проверьте что товар существует!'
  end
  
  def input_code
    puts 'Пожалуйста ведите код товара через пробел'
    @input_code = gets.chomp.downcase.split(' ')
  end

  def welcome
    puts 'Добро пожаловать в cимулятор СУПЕРМАРКЕТ-МОГО!'
  end

  def info
    puts %(
    | Код |  Название  |  Цена |
    |:---:|:----------:|:-----:|
    |  CC |  Кока-Кола | $1.50 |
    |  PC | Пепси Кола | $2.00 |
    )
  end

  # method so ... all of a sudden it will be necessary to declare admission
  def admission_rules
    puts %(
    Для некоторых товаров есть определенные правила дисконтирования:
    
    1. Если покупаете 3 и более бутылки Пепси Колы, 
    то стоимость каждой бутылки Пепси Колы снижается на 20%.
    
    2. Если покупаете одну бутылку Кока Колы, то вторая даётся бесплатно.
    )
  end

  def total(key, value, mount)
    puts %(
    Cчет:
    ---------------
    #{key}    #{value}
    Итого цена    #{mount}
    )
  end
end
