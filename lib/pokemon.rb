class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    new_pokemon = db.execute(sql, id)
    Pokemon.new(id, new_pokemon[1], new_pokemon[2], new_pokemon[3], db)
  end


end
