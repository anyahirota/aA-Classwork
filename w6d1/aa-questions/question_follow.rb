require_relative 'questions_database'
require_relative 'question'
require_relative 'user'
require_relative 'question_like'
require_relative 'reply'

class Question_Follow
    attr_accessor :id, :question_id, :user_id

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
        data.map {|datum| Question_Follow.new(datum)}
    end 

     def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        return nil unless data.length > 0 
        Question_Follow.new(data.first)
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end 
end 
