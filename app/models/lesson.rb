class Lesson
  def self.lessons
    (1..100).to_a
  end
  def self.parts
    (1..3).to_a
  end
  def self.lessons_with_parts
    self.lessons.product(parts)
  end
  def self.next?(current_lesson_and_part, test_lesson_and_part)
    current_index = Lesson.lessons_with_parts.index(current_lesson_and_part)
    test_index = Lesson.lessons_with_parts.index(test_lesson_and_part)
    current_index != nil && test_index != nil && test_index == current_index + 1
  end
end