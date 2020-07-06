require_relative 'questions_database'
require_relative 'question'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'

class User
    def self.find_by_id(id)(<<-SQL, id: id)
      SELECT
        users.*
      FROM
        users
      WHERE
        users.id = :id
    SQL

    user_data.nil? ? nil : User.new(user_data)
    end
        # data = QuestionsDatabase.instance.execute('SELECT * FROM users')
        # data.map {|datum| User.new(datum)}

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end 

#     def attrs
#     { fname: fname, lname: lname }
#   end

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