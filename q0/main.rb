require "./base.rb"

class Q0::Main < Base
  def self.execute
    puts "好きな数字を入力してください"
    num_1 = gets.chomp.to_i

    puts "もう一度数字を入力してください"
    num_2 = gets.chomp.to_i

    puts "足し算します"

    sum = (num_1 + num_2)

    puts sum
  end
end
