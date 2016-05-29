module Teacher
  def model_name
    ActiveModel::Name.new(Teacher)
  end
  def full_name
    "#{first_name} #{last_name}"
  end
end