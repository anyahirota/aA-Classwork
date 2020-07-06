require_relative 'questions_database'
require_relative 'question'
require_relative 'question_follow'
require_relative 'user'
require_relative 'reply'

class Question_Like
    def self.find_by_id
        data = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
        data.map {|datum| Question_Like.new(datum)}
    end 
end 