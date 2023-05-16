class CsvImporter
  require "csv"

  def call(file)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ",")
    csv.each do |row|
      user_hash = {}
      user_hash[:username] = row["Username"]
      user_hash[:email] = row["Email"]
      user_hash[:mobile] = row["Mobile phone number"]
      User.find_or_create_by!(user_hash)
    end
  end
end
