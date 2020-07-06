require_relative 'questions_database'
require_relative 'question'
require_relative 'user'
require_relative 'question_like'
require_relative 'reply'

class Question_Follow
    def self.find_by_id
        data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
        data.map {|datum| Question_Follow.new(datum)}
    end 
end 