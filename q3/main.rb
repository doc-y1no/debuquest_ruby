require "./base.rb"
require "./q3/sample_api.rb"

class Q3::Main < Base
  def self.execute
    client = Q3::SampleApi.new
    base_info = client.get_sample_user_info(type: :base)
    detail_info = client.get_sample_user_info(type: :detail)
    user_info = base_info
    detail_info2 = detail_info
    # binding.pry
    user_id_result = "対象のユーザーの id は #{user_info[:id]} です。"
    # binding.pry
    user_country_result = "対象のユーザーの country は #{detail_info2[:country]} です。"

    puts user_id_result
    puts user_country_result
  end
end
