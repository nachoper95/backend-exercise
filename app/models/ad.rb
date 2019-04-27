class Ad < ApplicationRecord
  belongs_to :business, optional: true
  belongs_to :publisher, optional: true

  enum state: [:requested, :pre_associated, :associated, :content_ready, :completed, :cancelled]

  after_save :set_state
  after_update :set_state

  validates_presence_of :print_version_url

  # Verifies ad if state is pre_associated
  def verify(verified)
    if self.state == "pre_associated"
      if verified == "1"
        self.associated!
      else
        self.business = nil
        self.publisher = nil
        self.requested!     
      end
    end
  end
  
  # Cancel ad if state isn't completed
  def cancel
    if self.state != "completed"
      self.cancelled!
    end
  end

  private

  # Define ad state
  def set_state
    case self.state
    when "requested"
      if self.business_id.present? && self.publisher_id.present?
        self.pre_associated!
      end
    when "associated"
      if self.title.present? && self.description.present?
        self.content_ready!
      end
    when "content_ready"
      if self.start_date.present? && self.end_date.present?
        self.completed!
      end
    end
  end
end
