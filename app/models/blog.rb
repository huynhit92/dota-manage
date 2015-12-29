class Blog < ActiveRecord::Base

  belongs_to :user
  belongs_to :blog_category

  def self.compact_json
    return {
      :include => {
        :blog_category => {}
     },
     :methods => :methods_json
   }
  end

end
