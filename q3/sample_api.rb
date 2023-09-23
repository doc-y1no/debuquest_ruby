require './base.rb'

class Q3::SampleApi
  def get_sample_user_info(type: :base)
    id = "123abc"
    name = "木村"
    age = 30
    country = "japan"

    case type.to_sym
    when :base
      {
        id: id,
        name: name,
      }
    when :detail
      {
        age: age,
        country: country,
      }
    else
      raise sample_api.rb "Invalid type Error!"
    end
  end
end
