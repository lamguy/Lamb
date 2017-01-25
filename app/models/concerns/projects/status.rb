module Projects
  module Status
    extend ActiveSupport::Concern

    def statuses
      return ["Closed", "Open", "Archived"]
    end

    def status_label
      return statuses[self[:status]]
    end
  end
end