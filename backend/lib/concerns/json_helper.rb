module JsonHelper
  def parse_data_from_json_file file_name
    JSON.parse File.read(file_name), symbolize_names: true
  end

  def write_hash_to_json_file file_name, hash
    File.open file_name, "w" do |f|
     f.write JSON.pretty_generate hash
    end
  end
end
