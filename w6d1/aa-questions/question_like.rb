require_relative 'questions_database'
require_relative 'question'
require_relative 'question_follow'
require_relative 'user'
require_relative 'reply'

class Question_Like
    attr_accessor :id, :liker_id, :question_id

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
        data.map {|datum| Question_Like.new(datum)}
    end 

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        return nil unless data.length > 0 
        Question_Like.new(data.first)
    end

    def initialize(options)
        @id = options['id']
        @liker_id = options['liker_id']
        @question_id = options['question_id']
    end 
end 