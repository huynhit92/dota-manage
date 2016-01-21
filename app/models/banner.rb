class Banner < ActiveRecord::Base
  belongs_to :blog

  def self.compact_json
    
  end

end
