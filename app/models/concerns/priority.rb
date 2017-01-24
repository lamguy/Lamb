module Priority
  extend ActiveSupport::Concern

  def priorities
    return ["Uncategorized", "Lowest", "Low", "Normal", "High", "Highest"]
  end

  def priority_label
    return priorities[self.priority]
  end
end