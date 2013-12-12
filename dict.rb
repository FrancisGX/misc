class Dictionary
	def word_list
		File.open('/usr/share/dict/words')
	end

	def words
		word_list.to_a.map { |word| word.chomp }
	end

	# not currently relevant
	# def long_words(num=5)
	# 	word_list.sort_by(&:length).reverse.take(num)
	# end

	def check_name
		puts "Hello. What is your first name?"
		gets.chomp.downcase
	end

	def words_that_match(name)
		result = words.keep_if { |word| word.include?(name) }

		puts "Your name can be found in #{result.length} words in our current dictionary."
		p result
	end
end

dict = Dictionary.new
name = dict.check_name
dict.words_that_match(name)

# 2013-04-08 08:04:29
# The idea behind this refactoring was to focus on expressability
# by giving methods one purpose only and moving variables into
# instance methods

# words = Dictionary.new.long_words.take(3).to_a.map { |word| word.chomp }
# result = Dictionary.new.word_list.include?("#{name}")
# puts "#{result}"
# Dictionary.new.word_list.to_a.each { |word| word.include?(name) ? "#{word}" : "none" }

# Refactoring to make this more expressive. This was the code before.
# class Dictionary
# 	def word_list
# 		File.open('/usr/share/dict/words')
# 	end

# 	def long_words(num=5)
# 		word_list.sort_by(&:length).reverse.take(num)
# 	end

# 	def check_name
# 		puts "Hello. What is your first name?"
# 		name   = gets.chomp.downcase
# 		words  = Dictionary.new.word_list.to_a.map { |word| word.chomp }
# 		result = words.keep_if { |word| word.include?(name) }

# 		puts "Your name matches #{result.length} words in our current dictionary."
# 		p result
# 	end
# end
