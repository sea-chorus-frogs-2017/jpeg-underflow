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
question_ids = Question.all.pluck(:id)
30.times do
  Answer.create( {
    question_id: question_ids[rand(0..29)],
    user_id: rand(1..10),
    answer_text: answer_fodder[rand(0..4)]
    })
end

question_comment_fodder = ['I like this question.','I do not like this question', 'This is the best question I have seen all day.','Hmmmm... try again, please, with a better question','I like your question, I just do not love it']
question_ids = Question.all.pluck(:id)
30.times do
  Comment.create( {
    user_id: rand(1..10),
    comment_text: question_comment_fodder[rand(0..4)],
    commentable_id: question_ids[rand(0..29)],
    commentable_type: 'Question'
    })
end

answer_comment_fodder = ['I like this answer.','I do not like this answer', 'This is the best answer I have seen all day.','Hmmmm... try again, please, with a better answer','I like your answer, I just do not love it']
answer_ids = Answer.all.pluck(:id)
30.times do
  Comment.create( {
    user_id: rand(1..10),
    comment_text: answer_comment_fodder[rand(0..4)],
    commentable_id: answer_ids[rand(0..29)],
    commentable_type: 'Answer'
    })
end

comment_comment_fodder = ['This is a great comment.','I really like this comment.','I do not like this comment.', 'This comment is the best thing I have seen all day.','Hmmmm... try again, please, with a better comment','I like your comment, I just do not love it.']
comment_ids=Comment.all.pluck(:id)
30.times do
  Comment.create( {
    user_id: rand(1..10),
    comment_text: comment_comment_fodder[rand(0..5)],
    commentable_id: comment_ids[rand(0..29)],
    commentable_type: 'Comment'
    })
end


vote_fodder=['up','down']
30.times do
  Vote.create( {
    user_id: rand(1..10),
    votable_id: answer_ids[rand(0..29)],
    votable_type: 'Answer',
    up_or_down: vote_fodder[rand(0..1)]
    })
end

30.times do
  Vote.create( {
    user_id: rand(1..10),
    votable_id: question_ids[rand(0..29)],
    votable_type: 'Question',
    up_or_down: vote_fodder[rand(0..1)]
    })
end

30.times do
  Vote.create( {
    user_id: rand(1..10),
    votable_id: comment_ids[rand(0..29)],
    votable_type: 'Comment',
    up_or_down: vote_fodder[rand(0..1)]
    })
end
