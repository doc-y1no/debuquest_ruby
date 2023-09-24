require "./base.rb"
require "./q4/calc.rb"

class Q4::Main < Base
  def self.execute
    numbers = [2, 5, 10, 30]
    binding.pry
    # ここから下のコードは変更しないこと
    if Q4::Calc.twice(numbers) == [4, 10, 20, 60]
      puts "おめでとう！正解です！"
    else
      raise
    end

  rescue
    puts "残念！不正解！ binding.pry を使いながらどの処理に問題があるか確認しましょう！"
  end
end
