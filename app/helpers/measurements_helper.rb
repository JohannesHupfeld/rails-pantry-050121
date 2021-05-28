module MeasurementsHelper
  def show_item_name(m, index)
     m.item.name if index
  end
end

# Helpers created here should be all about what the user sees. formatting only. not queering the database, not checking the current user etc. 
# View helpers 