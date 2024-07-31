class Campaign::CreateForm
  include ActiveModel::Model

  attr_accessor :dm_id, :name, :next_session

  validates :dm_id, :name, presence: true
  validate :future_date

  def create
    return false if invalid?

    save
  end

  private

  def save
    campaign = Campaign.new(dm_id: dm_id, name: name, next_session: next_session)

    if campaign.save
      true
    else
      errors.add(:base, 'Campaign could not be created')
      false
    end
  end

  def future_date
    return if next_session.blank?
    if next_session_date < Date.today
      errors.add(:next_session, " must be today or a date in the future.")
    end
  end

  def next_session_date
    Date.parse(next_session) rescue nil
  end
end
