require "./base.rb"
require "./q6/user.rb"

class Q6::Main < Base
  def self.execute
    puts "〜管理ユーザー作成〜"
    admin_user = Q6::User.new(name: "管理ユーザー", role: "admin")
    admin_user.disp_data

    puts "〜一般ユーザー作成〜"
    general_user = Q6::User.new(name: "一般ユーザー", role: "general")
    general_user.disp_data

    puts "〜管理ユーザーによるユーザー作成〜"
    params = { name: "ユーザー1", role: "general" }
    user1 = admin_user.create_user(params)
    user1.disp_data
    puts "〜一般ユーザーによるユーザー作成〜"
    params = { name: "ユーザー2", role: "general" }
    user2 = general_user.create_user(params)#ここにuser2.disp_dataを追記すれば、適正になるが、修正不可　user.rbで代用できる記述が必要

    puts "〜一般ユーザーによりユーザー1の権限を変更〜"
    general_user.grant_admin_role(user1)
    user1.disp_data

    puts "〜管理ユーザーにより一般ユーザーを管理ユーザーに変更〜"
    admin_user.grant_admin_role(general_user)
    general_user.disp_data

    puts "〜管理ユーザーにより上記ユーザーの権限を一般ユーザーに戻す〜"
    admin_user.grant_general_role(general_user)
    general_user.disp_data
  end
end
