require_relative 'questions'
require 'sqlite3'

class Reply
  attr_accessor :body, :id, :question_id, :parent_id, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end


  def self.find_by_author_id(author_id)
    data =  QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
      *
      FROM
      replies
      WHERE
      author_id = ?
    SQL

    Reply.new(data.first)
  end

  def self.find_by_question_id(question_id)
    data =  QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
      *
      FROM
      replies
      WHERE
      question_id = ?
    SQL

    Reply.new(data.first)
  end

  def child_replies
    data =  QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
      SELECT
      *
      FROM
      replies
      WHERE
      id = ?
    SQL

    Reply.new(data.first)
  end

  def initialize(options)  
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @author_id = options['author_id']  
    @body = options['body']
  end

end

