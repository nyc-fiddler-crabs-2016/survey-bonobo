User.create!(username: "tim", password: "password", email:"ryan@charlie.com")
Survey.create(name: "Elephants", author_id: 1)
Question.create(content:"What is an Elephant to you?", survey_id: 1)
Choice.create(content:"It all started with my mother...", question_id: 1)
Choice.create(content:"Large, Bold, Grey", question_id: 1)
Question.create(content:"Don't you hate pants?!", survey_id: 1)
Choice.create(content:"Yes.", question_id: 2)
Choice.create(content:"No, pants are amazing", question_id: 2)
Question.create(content:"What number am I thinking of?!", survey_id: 1)
Choice.create(content:"7.", question_id: 3)
Choice.create(content:"4", question_id: 3)
