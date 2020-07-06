require_relative 'questions_database'
require_relative 'user'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'

class Question
    attr_accessor :id, :title, :body, :author_id

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM questions')
        data.map {|datum| Question.new(datum)}
    end 

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless data.length > 0 
        Question.new(data.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end 
end 