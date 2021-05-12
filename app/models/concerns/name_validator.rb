class NameValidator < ActiveModel::EachValidator
  
  def validate_each(record, attribute, value)
    if attribute == :name && (Item.find_by_name(value)) # if attribute is name and there already is an item that exists with this name we want to call errors
      record.errors.add(attribute, "is already taken!")
    end
  end
end