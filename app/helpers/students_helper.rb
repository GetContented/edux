module StudentsHelper
  def lessons
    (1..100).map{|n| ["L#{n}",n]}
  end
  def parts
    (1..3).map{|n| ["P#{n}",n]}
  end
end