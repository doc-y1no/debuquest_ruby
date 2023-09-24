class Q5::SlotMachine
  def rotate
    puts "「y」 キーを押してスロットマシーンを回してください！"

    begin
      input_key = gets.chomp

      raise unless input_key == "y"
    rescue
      puts "「y」キーを押してください"
      retry
    end
  end

  def check_numbers(number1:, number2:, number3:)
    same_numbers_count = count_same_numbers(number1: number1, number2: number2, number3: number3)
    puts "結果: |#{number1}|#{number2}|#{number3}|"
    case same_numbers_count
    when 1
      puts "残念！ハズレ！"
    when 2
      puts "惜しい！"
    when 3
      puts "大当たり！"
    end
  end

  private

    def count_same_numbers(number1:, number2:, number3:)
      same_numbers_count = if (number1 == number2 && number1 == number3 )#1と2が一緒　3が違うのに、大当たりが出た。3も一緒にならないと行けない　左の式で本来1＝2　で1＝3なら2と3も必然的に一緒になるはず。別のところに原因はあるのか。あった。
                            3
                          elsif number1 != number2 && number1 != number3 && number2 != number3 #　面倒なので、どこか全部バラバラを作成する。　→先に書いていた1と2が一緒のときは、1と3、2と3は同じではいけない　これだと、2つ以上同じの場合などが出てしまう。
                            1
                          else
                            2 #ここを2つ一致に変更数字を3に変更
                          end
      same_numbers_count
    end
end
