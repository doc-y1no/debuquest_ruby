require "./base.rb"

class Q4::Calc < Base
  def self.twice(numbers)#どこを参照しているか、認識するようにする　。
    # numbers * 2 #配列から要素を一つづつ取り出して、2倍にして、再度配列の値として追加する。
    numbers2 = []
    numbers.each do |number|
      twice_number = number * 2 #ここの2倍の数字を11行目のnumberに入れていない 同じ名称は避ける
      numbers2.push(twice_number)
      #配列への代入の仕方

    end#実際にできているか確認はループの外から確認
    numbers2
  end
end
