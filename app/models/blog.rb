class Blog < ActiveRecord::Base

  belongs_to :user
  belongs_to :blog_category

  validates :blog_category_id, :title, :content, presence: true
  validates :title, uniqueness: true
  validates :blog_category_id, numericality: { only_integer: true }

  def self.compact_json
    return {
      :include => {
        :blog_category => {}
     },
     :methods => :methods_json
   }
  end

end
