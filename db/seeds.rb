# This file should contain all the record creation needed to seed the database with its default values.

puts "-- Create Categories"
categories = []
categories << Category.find_or_create_by(title: 'Front end')
categories << Category.find_or_create_by(title: 'Back end')
categories << Category.find_or_create_by(title: 'Hardware programming')
categories << Category.find_or_create_by(title: 'Operating systems')

puts "-- Create Users"
users = []
u = User.find_by(email: 'john_doe@example.com', first_name: 'John', last_name: 'Doe')
if u.blank?
  u = User.new(login: 'john', email: 'john_doe@example.com', first_name: 'John', last_name: 'Doe')
  u.confirmed_at = Time.now
  u.password = '123456'
  u.save
end
users << u

u = User.find_by(email: 'foo_bar@example.com', first_name: 'Foo', last_name: 'Bar')
if u.blank?
  u = User.new(login: 'foo', email: 'foo_bar@example.com', first_name: 'Foo', last_name: 'Bar')
  u.confirmed_at = Time.now
  u.password = '123456'
  u.save
end
users << u

a = Admin.where(login: 'admin', email: 'admin@example.com', first_name: 'Admin', last_name: 'Super', confirmed_at: Time.now).first_or_create
a.password = "123456"
a.save
users << a

puts "-- Create My Tests"
tests = []
tests << t1 = Test.find_or_create_by(title: "Rails",  level: 'simple', category_id: categories[0].id, author_id: users[0].id)
tests << t2 = Test.find_or_create_by(title: "Elixir", level: 'simple', category_id: categories[0].id, author_id: users[0].id)
tests << t3 = Test.find_or_create_by(title: "Ruby",   level: 'middle', category_id: categories[1].id, author_id: users[1].id)
tests << t4 = Test.find_or_create_by(title: "HTML",   level: 'middle', category_id: categories[2].id, author_id: users[1].id)
tests << t5 = Test.find_or_create_by(title: "CSS",    level: 'hard',   category_id: categories[3].id, author_id: users[1].id)

puts "-- Create Test Passages"
test_passages = []
test_passages << TestPassage.find_or_create_by(user_id: users[0].id, test_id: tests[0].id)
test_passages << TestPassage.find_or_create_by(user_id: users[0].id, test_id: tests[1].id)
test_passages << TestPassage.find_or_create_by(user_id: users[0].id, test_id: tests[2].id)
test_passages << TestPassage.find_or_create_by(user_id: users[0].id, test_id: tests[3].id)
test_passages << TestPassage.find_or_create_by(user_id: users[1].id, test_id: tests[4].id)

puts "-- Create Questions"
questions = []
questions << Question.find_or_create_by(number: 1, test_id: tests[0].id, body: 'What is View ?')
questions << Question.find_or_create_by(number: 2, test_id: tests[0].id, body: 'What is Model ?')
questions << Question.find_or_create_by(number: 3, test_id: tests[0].id, body: 'What is Controller ?')
questions << Question.find_or_create_by(number: 4, test_id: tests[0].id, body: 'What is MVC ?')

questions << Question.find_or_create_by(number: 1, test_id: tests[1].id, body: 'What is Elixir ?')
questions << Question.find_or_create_by(number: 2, test_id: tests[1].id, body: 'Is it functional ?')
questions << Question.find_or_create_by(number: 3, test_id: tests[1].id, body: 'Use MVC ?')
questions << Question.find_or_create_by(number: 4, test_id: tests[1].id, body: 'Use Classes ?')

puts "-- Create Answers"
Answer.find_or_create_by(question_id: questions[0].id, body: 'View is what we see in browser', correct: true)
Answer.find_or_create_by(question_id: questions[0].id, body: 'View is html', correct: true)
Answer.find_or_create_by(question_id: questions[0].id, body: 'View is what we see in browser', correct: true)

Answer.find_or_create_by(question_id: questions[1].id, body: 'Controller is file', correct: true)
Answer.find_or_create_by(question_id: questions[1].id, body: 'text', correct: false)
Answer.find_or_create_by(question_id: questions[1].id, body: 'css', correct: false)

Answer.find_or_create_by(question_id: questions[2].id, body: 'this one', correct: true)
Answer.find_or_create_by(question_id: questions[2].id, body: '222', correct: false)
Answer.find_or_create_by(question_id: questions[2].id, body: '333', correct: false)

Answer.find_or_create_by(question_id: questions[3].id, body: 'this one', correct: true)
Answer.find_or_create_by(question_id: questions[3].id, body: '555', correct: false)
Answer.find_or_create_by(question_id: questions[3].id, body: '666', correct: false)

Answer.find_or_create_by(question_id: questions[4].id, body: 'this one', correct: true)
Answer.find_or_create_by(question_id: questions[4].id, body: '555', correct: false)
Answer.find_or_create_by(question_id: questions[4].id, body: '666', correct: false)

Answer.find_or_create_by(question_id: questions[5].id, body: 'this one', correct: true)
Answer.find_or_create_by(question_id: questions[5].id, body: '555', correct: false)
Answer.find_or_create_by(question_id: questions[5].id, body: '666', correct: false)

Answer.find_or_create_by(question_id: questions[6].id, body: 'this one', correct: true)
Answer.find_or_create_by(question_id: questions[6].id, body: '555', correct: false)
Answer.find_or_create_by(question_id: questions[6].id, body: '666', correct: false)

Answer.find_or_create_by(question_id: questions[7].id, body: 'this one', correct: true)
Answer.find_or_create_by(question_id: questions[7].id, body: '555', correct: false)
Answer.find_or_create_by(question_id: questions[7].id, body: '666', correct: false)
