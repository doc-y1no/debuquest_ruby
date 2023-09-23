require "./base.rb"
require "./q2/user.rb"

class Q2::Main < Base
  def self.execute
    puts "お名前を入力してください"
    name = gets.chomp

# binding.pry
    if !name.match(/^[-+]?\d+$/)
      # binding.pry
      user = User.new(name)
      user.self_introduce(name)
    else
      # binding.pry
      return puts "文字列で入力してください"

    end
  end
end

#以下答え
#main.rb
# require "./base.rb"
# require "./q2/user.rb"

# class Q2::Main < Base
#   def self.execute
#     puts "お名前を入力してください"

#     name = gets.chomp
#     is_name_string = !name.match(/[0-9]+/)
# -    return puts "文字列で入力してください" if is_name_string
# +    return puts "文字列で入力してください" unless is_name_string
#     user = User.new(name)
#     user.self_introduce
#   end
# end

# user.rb
# class User
#   def initialize(name)
#     @name = name
#   end

#   def self_introduce
# -    puts "私の名前は #{name} です！！"
# +    puts "私の名前は #{@name} です！！"
#   end
# end
