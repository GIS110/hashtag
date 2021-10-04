if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Программа «вытаскивает» из строки, введенной пользователем хэштеги
# Хэштегом мы считаем символ решетки и следующие за ним сколько угодно букв
# (как русских, так и латинских, как прописных, так и заглавных),
# цифр, знаков подчеркивания и минусов.
# Знаки препинания (запятая, точка, восклицательный и вопросительный знаки)
# и пробелы «рвут» хэштег.

# Например:
# Введите строку с хэштегами:
# Будете у нас на #Колыме? Нет, уж лучше #вы_к_нам!
# Нашли вот такие хэштеги: #Колыме, #вы_к_нам

puts 'Введите строку с хэштегами:'
user_words = STDIN.gets.encode("UTF-8").chomp.split(/[,.!? ]/)

hashtags = []
user_words.each { |word| hashtags << word if word.include?('#') }

puts %{Нашли вот такие хэштеги: #{hashtags.join(', ')}}
