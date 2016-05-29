require "test_helper"

describe Lesson do
  it "must have 300 lesson-parts" do
    Lesson.lessons_with_parts.size.must_equal 300
  end

  it "must allow checking of the next lesson-part as sequential" do
    this_lesson_part = [1,1]
    next_lesson_part = [1,2]
    Lesson.next?(this_lesson_part, next_lesson_part).must_equal true
  end

  it "must disallow equal lesson-part checking" do
    this_lesson_part = [1,1]
    next_lesson_part = [1,1]
    Lesson.next?(this_lesson_part, next_lesson_part).must_equal false
  end

  it "must disallow less-than lesson-part checking" do
    this_lesson_part = [5,2]
    next_lesson_part = [5,1]
    Lesson.next?(this_lesson_part, next_lesson_part).must_equal false
  end

  it "must disallow non-valid lesson-part checking" do
    this_lesson_part = ["bananas","chocolate"]
    next_lesson_part = [5,1]
    Lesson.next?(this_lesson_part, next_lesson_part).must_equal false
  end

  it "must disallow large increment lesson-part checking" do
    this_lesson_part = [1,3]
    next_lesson_part = [5,1]
    Lesson.next?(this_lesson_part, next_lesson_part).must_equal false
  end
end
