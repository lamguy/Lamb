module Tasks
  module Description
    extend ActiveSupport::Concern

    def description
      if self[:description].blank?
        return "Empty description"        
      else
        return self[:description]
      end
    end
  end
end