class Parser

  def initialize
    file = File.open('lib/assets/animals.csv', "r")
    @data = file.read
    file.close
    @data
  end

  def write
    full_text = "Brain.destroy_all\n"
    per_line =  @data.lines.map(&:chomp)
    per_line.each do |line|
      row = line.split(",")
      full_text += "Brain.create!(animal: #{row[0]}, body: #{row[1].to_f}, brain:#{row[2].to_f})\n"
    end
    open('db/seeds.rb', 'w') {|f| f << full_text}
  end

end
