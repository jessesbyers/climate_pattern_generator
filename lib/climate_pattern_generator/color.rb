class ClimatePatternGenerator::Color
  attr_accessor :color, :min, :max
  attr_reader :id
  @@all = []

  def initialize(color, min, max, id=nil)
    @color = color
    @min = min
    @max = max
    @id = id
    # @@all << self
  end

  def self.all
    @@all
  end

  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS colors (
        id INTEGER PRIMARY KEY,
        color TEXT,
        min INTEGER,
        max INTEGER
        )
        SQL
    DB[:conn].execute(sql)
  end

  def save
   sql = <<-SQL
     INSERT INTO colors (id, color, min, max)
     VALUES (?, ?, ?, ?)
   SQL

   DB[:conn].execute(sql, self.color, self.min, self.max)

   @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
 end

 def self.create(color, min, max)
   color = Color.new(color, min, max)
   color.save
   color
 end




end
