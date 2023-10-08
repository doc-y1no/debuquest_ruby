require "./base.rb"
#①権限のところが表示されていない。　すべての項目
#②一般ユーザによるユーザ作成と、一般ユーザによりユーザー1の権限を変更が、区切られていない
#③権限の箇所の名称が異なる。「general」→「一般」　[admin]→「管理者」
class Q6::User < Base
  attr_accessor :name, :role
  ROLE = { admin: "管理者", general: "一般" }
  def initialize(name:, role:)
    @name = name #⇒"管理ユーザ
    @role = role#⇒"管理者"
  end

  def create_user(params)#ここに記述すると、②と③がクリアされそう。
   Q6::User.new(params)#user2のparamsを受け取ったら、user2.disp_dataを記載したのと同じ動作をさせたい。しかしただ記述しただけではエラーかつ、動かしてもおそらくuser1も同じになるかも。そもそもここから表示させられたらのはなし、、、
   # binding.pry

  end

  def general!
    role = :general
  end

  def admin!
    role = :admin
  end

  def grant_general_role(target_user)
    case role.to_sym
    when :admin
      target_user.general!
    when :general
      puts "※権限がありません※"
      puts "--------------------"
    end
  end

  def grant_admin_role(target_user)
    case role.to_sym
    when :admin
      target_user.admin!
    when :general
      puts "※権限がありません※"
      puts "--------------------"

    end
  end

  def disp_data #disp_dataの"権限: #{ROLE[role]}"がnilの様子　roleにデータが届いていない？
    #本来は"管理者"と表示されるはず。
    puts "名前: #{ROLE[:@name]}"
    puts "権限: #{ROLE[:@role]}" #ここを修正することで、すべての権限が出てきた。
    # binding.pry
    puts "--------------------"
  end
end
