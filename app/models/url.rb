# == Schema Information
#
# Table name: urls
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  public     :boolean
#

class Url < ActiveRecord::Base

  # attribute accessor
  attr_accessible :url, :public

  # relations
  belongs_to :user

  # validations
  validates_format_of :url, :with => URI::regexp(%w(http https))

  # callbacks
  after_create :generate_token

  # increase total count
  def hit!
    self.total_hit += 1
    self.save(validate: false)
  end


  private

    # generate token URL
    def generate_token
      if token.blank?
        self.token = self.id.to_s(32)
        self.save
      end
    end
end
