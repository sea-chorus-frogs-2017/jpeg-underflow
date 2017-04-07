User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all

email_fodder=['hi@hi.com','cornman@corny.com','sparky@happy.com','grace@comcast.net','eitan@gmail.com']
100.times do
  User.create( {
    email: email_fodder[0..4],
    password: 'hunter2'
    })
end

question_fodder=['How do I wash my hair?','Can I please have some popcorn?', 'How do I eat a banana?','Should I go to sleep?']
100.times do
  Question.create( {
    user_id: rand(1..100),
    question_text: question_fodder[rand(0..3)]
    })
end

answer_fodder=['Yes','No','Jump up and down and your problem will be solved','Ask your mom to do it','Jumping jacks will solve your problem']
100.times do
  Answer.create( {
    question_id: rand(1..100),
    user_id: rand(1..100),
    answer_text: answer_fodder[rand(0..4)]
    })
end

class_names = ['Answer','Question','Comment']
comment_fodder = ['I like it.','I do not like it', 'This is the best thing I have seen all day.','Hmmmm... try again, please']
100.times do
  Comment.create( {
    user_id: rand(1..100),
    comment_text: comment_fodder[rand(0..3)],
    user_id: rand(1..100),
    commentable_id: rand(1..100),
    comentable_type: class_names[rand(0..2)]
    })
end

vote_fodder=['up','down']
100.times do
  Vote.create( {
    user_id: rand(1..100),
    answer_id: rand(1..100),
    up_or_down: vote_fodder[rand(0..1)]
    })
end
