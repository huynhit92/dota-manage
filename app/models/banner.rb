class Banner < ActiveRecord::Base
  belongs_to :blog

  def self.compact_json
    return {
      :include => {
        :blog => {}
      }
    }
  end

end
