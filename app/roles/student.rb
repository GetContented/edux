class Student
  attr_reader :data_object

  def initialize(data_object)
    @data_object = data_object
  end

  delegate :first_name, :first_name=, :last_name, :last_name=, to: :data_object
  delegate :model_name, :to_key, to: :data_object

  def register!
    @data_object.save
  end
end