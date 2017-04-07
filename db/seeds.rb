User.destroy_all
Question.destroy_all
Answer.destroy_all
Vote.destroy_all
Comment.destroy_all

email_fodder=['hello@hi.com','bob@smith.com','mary@jones.com','jpeg@rules.com','hi@hi.com','cornman@corny.com','sparky@happy.com','grace@comcast.net','eitan@gmail.com','bobby@yodel.com']
i = 0
while i < 10 do 
  User.create( {
    email: email_fodder[i],
    password: 'hunter2'
    })
    i += 1
end



question_fodder=['How do I wash my hair?','Can I please have some popcorn?', 'How do I eat a banana?','Should I go to sleep?']
30.times do
  Question.create( {
    user_id: rand(1..10),
    question_text: question_fodder[rand(0..3)]
    })
end

answer_fodder=['Yes','No','Jump up and down and your problem will be solved','Ask your mom to do it','Jumping jacks will solve your problem']
30.times do
  Answer.create( {
    question_id: rand(1..30),
    user_id: rand(1..10),
    answer_text: answer_fodder[rand(0..4)]
    })
end

class_names = ['Answer','Question','Comment']
comment_fodder = ['I like it.','I do not like it', 'This is the best thing I have seen all day.','Hmmmm... try again, please']
30.times do
  Comment.create( {
    user_id: rand(1..10),
    comment_text: comment_fodder[rand(0..3)],
    commentable_id: rand(1..30),
    commentable_type: class_names[rand(0..2)]
    })
end

vote_fodder=['up','down']
30.times do
  Vote.create( {
    user_id: rand(1..10),
    answer_id: rand(1..30),
    up_or_down: vote_fodder[rand(0..1)]
    })
end
