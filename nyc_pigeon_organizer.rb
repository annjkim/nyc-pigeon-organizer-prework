require 'pry'

def nyc_pigeon_organizer(data)
  pigeon_names = data.values.each_with_object([]) {|property_hash, names_array| names_array << property_hash.values}.flatten.uniq
  pigeon_keys = data.keys

  #create a new hash where each key is a pigeon name, and each value is a hash
  #and that hash's keys are the pigeon data keys = an empty array
  new_hash = pigeon_names.each_with_object({}) do |name, hash|
    hash[name] = Hash.new
    pigeon_keys.each do |key|
      hash[name][key] = []
    end
  end


  #for every pigeon nested within the passed hash
  #add the property for which its listed under
  #to the new hash
  pigeon_data.each do |attr_key, property_hash|
    property_hash.each do |property_key, names_array|
      names_array.each do |pigeon|
        new_hash[pigeon][attr_key] << property_key.to_s 
      end
    end
  end

  #return the new hash
  new_hash

end