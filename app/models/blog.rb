class Blog < ActiveRecord::Base

  belongs_to :user

  validates :title, :content, presence: true
  validates :title, uniqueness: true

  def self.compact_json
    
  end

end
