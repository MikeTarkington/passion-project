General Heroku Commands to Deploy project:
- bundle exec rackup -p 9292 config.ru & (test locally)
- heroku create
- git push heroku master
- heroku config:set API_KEY_VARIABLE_NAME='blah' ANOTHER_API_KEY='blah' (used to set your keys for api calls)
- heroku logs
- heroku logs --tail (to view console session that watches server activity continuously)

association brainstorm:
- user has many questionnaires
- user has many answers through questionnaires

- a questionnaire belongs to a user
- questionnaires have many questions

- questions belong to questionnaires
- questions have many answers

- an answer belongs to a question
- a user has many answers through questions and then questionnaires

--OR--

User Table
has_many :responses


Quiz table
  Quiz_ID
  Questions = []
  Question2
  ...Question10

Response_table
  Response_ID
  Quiz_ID
  User_ID
  Response1
  Response2
  ...
  Response10

belongs_to :quiz
belongs_to :response

  a = a response

  puts a.quiz.Question1
  puts a.response1

**api from propublica**
https://projects.propublica.org/api-docs/congress-api/endpoints/

GET https://api.propublica.org/congress/v1/115/house/members.json

```ruby
require 'net/http'

url = URI("https://api.propublica.org/congress/v1/115/house/members.json")


http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-api-key"] = 'my key'
request["cache-control"] = 'no-cache'
request["postman-token"] = 'there was numbers from postman here'

response = http.request(request)
puts response.read_body
```
