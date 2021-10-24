# DebuQuest -Ruby-

## 実行方法

0. clone 後最初に以下を実行してください

```
bundle install --path vendor/bundle
```

1. アプリ直下で以下を実行

```
bundle exec ruby execution.rb
```

2. 挑戦したい問題番号を入力してください

```
挑戦する問題番号を入力してください！！
1
```

3. 「2」を実行すると、`execution.rb` 内の問題番号に対応したメソッドが実行されます
   例: 問 1 だと `q1メソッド` が実行されます。

4. 各問題の指示通りの挙動になるようにコードを修正してください

※修正対象のファイルは各問題番号に対応するフォルダの範囲内で修正してください。

例: 問 1 を修正する際は `q1フォルダ` 内のみで修正

## 問題

### 問 0

- Q. プログラムが正しく動くようにしてください

例

```
好きな数字を入力してください
1
もう一度数字を入力してください
5
足し算します
6
```

- 回答

```
require './base.rb'

module Q0
  class Method < Base
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
end

```

### 問 1

- Q. プログラムが正しく動くようにしてください

例

```
お名前を入力してください
あじー
あじーさん、こんにちわ！！
```

- 回答

```
require './base.rb'

module Q1
  class Method < Base
    def self.execute
      puts "お名前を入力してください"
      name = set_name

      return puts "文字列で入力してください" unless get_string?(name)

      disp_name(name)
    end

    def self.disp_name(name)
      puts "#{name}さん、こんにちわ！！"
    end
    private_class_method :disp_name

    def self.set_name
      name = gets.chomp

      name
    end
    private_class_method :set_name

    def self.get_string?(target)
      target.is_a?(String)
    end
    private_class_method :get_string?
  end
end

```

### 問 4

- Q1. 郵便番号は「ハイフンあり」「ハイフンなし」どちらも入力出来るように修正してください

```
◯ 100-0001
◯ 1000001
```

- 回答

`zip_client.rb`

```
def self.validate_zipcode(value)
  code_regex = /^[0-9]{3}-?[0-9]{4}$/

  value =~ code_regex
end
```

- Q2. 今のままプログラムを動かすと `uninitialized constant Q4::BaseApiClient::Faraday (NameError)` が発生します。このエラーを解消してください。

- 回答

`base_api_client.rb`

```
require "faraday_middleware"

module Q4
  module BaseApiClient
    private

    def self.get_connection(url, params = nil)
      conn = Faraday.new(url: url, params: params) do |f|
        f.request :json
        f.request :retry
        f.response :follow_redirects
        f.response :json
      end

      res = conn.get
    end
  end
en
```

- Q3. プログラムが次のように動くように修正してください。

例:1

```
郵便番号を入力してください
1000001

入力された郵便番号の住所は
東京都千代田区千代田 です
```

例:2

```
郵便番号を入力してください
000-0000

入力された郵便番号の住所は
不明な住所 です
```

- 回答

```
def self.get_full_address(zipcode)
  return raise Validation Error unless validate_zipcode(zipcode)

  params = { zipcode: zipcode }
  res = call(params)

  result = if !res.body['data'].nil?
             res.body["data"]["fulladdress"]
           else
             '不明な住所'
           end

  result
end

```

- 最終的なコード

`base_api_client.rb`

```
require "faraday_middleware"

module Q4
  module BaseApiClient
    private

    def self.get_connection(url, params = nil)
      conn = Faraday.new(url: url, params: params) do |f|
        f.request :json
        f.request :retry
        f.response :follow_redirects
        f.response :json
      end

      res = conn.get
    end
  end
end
```

`zip_client.rb`

```
require './q4/base_api_client.rb'

module Q4
  module ZipClient
    BASE_URL = 'https://api.zipaddress.net/'

    def self.get_full_address(zipcode)
      return raise Validation Error unless validate_zipcode(zipcode)

      params = { zipcode: zipcode }
      res = call(params)

      result = if !res.body['data'].nil?
                 res.body["data"]["fullAddress"]
               else
                 '不明な住所'
               end

      result
    end

    def self.call(params = nil)
      BaseApiClient.get_connection(BASE_URL, params)
    end
    private_class_method :call

    def self.validate_zipcode(value)
      code_regex = /^[0-9]{3}-?[0-9]{4}$/

      value =~ code_regex
    end
  end
end
```
