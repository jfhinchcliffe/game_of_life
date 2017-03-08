module Display

  def self.show(data)
    system "clear"
    data.each do |row|
      row.each do |cell|
        print pretty_output(cell)
      end
      print "\n"
    end
  end

  def self.pretty_output(cell)
    cell ? 'X' : ' '
  end

end
