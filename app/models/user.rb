class User < ActiveRecord::Base

  def self.search_all_field search_term
    User.where ["first_name ILIKE ? or last_name ILIKE ? or email ILIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%"]
  end

  def self.created_after after_date
    User.where(date:)
  end
end
