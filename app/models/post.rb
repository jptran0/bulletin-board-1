# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  expires_on :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
class Post < ApplicationRecord
  validates(:title, {presence: true})
  validates(:body, {presence: true})
  validates(:expires_on, {presence: true})

  belongs_to(:board)

  def posted
    time = self.created_at.strftime("%b %e, %Y")

    return time
  end

  def expiration
    time = self.expires_on.strftime("%b %e, %Y")
    return time
  end
end
