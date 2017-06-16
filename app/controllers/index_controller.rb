get '/' do
  @quiz = Quiz.first #will need to change if there are ever more quizes with diff questions
  erb :'/quiz_responses/new'
end
