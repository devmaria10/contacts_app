class Contact < ApplicationRecord
  validates :first_name, presence:true 
  validates :last_name, presence:true 
  validates :email, uniqueness:true 
  validates :email, format: { with: /\A.{2,}@\w{2,}[.][a-zA-Z]{2,3}\z/, message: "must be an email" }

  def friendly_updated_at
    updated_at.strftime("%b %d, %Y")
  end 

  def full_name
    "#{first_name} #{middle_name} #{last_name}".titleize
  end

  def japan_phone_number
    "+81 #{phone_number}"
  end 

  def as_json
    {
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
      phone_number: phone_number,
      updated_at: friendly_updated_at
    }
  end 

  
end
