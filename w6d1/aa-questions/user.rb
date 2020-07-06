require_relative 'questions_database'
require_relative 'question'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'

class User
    attr_accessor :id, :fname, :lname

    def self.all
        data = QuestionsDatabase.instance.execute('SELECT * FROM users')
        data.map {|datum| User.new(datum)}
    end 

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless data.length > 0 
        User.new(data.first)
    end

      def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        return nil unless data.length > 0 
        User.new(data.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end 

#   def save
#     if @id
#       QuestionsDatabase.execute(<<-SQL, attrs.merge({ id: id }))
#         UPDATE
#           users
#         SET
#           fname = :fname, lname = :lname
#         WHERE
#           users.id = :id
#       SQL
#     else
#       QuestionsDatabase.execute(<<-SQL, attrs)
#         INSERT INTO
#           users (fname, lname)
#         VALUES
#           (:fname, :lname)
#       SQL

#       @id = QuestionsDatabase.last_insert_row_id
#     end
#     self
#   end
end 