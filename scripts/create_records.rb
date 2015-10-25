class CreateRecords

  def self.item_sets
    RelHeroDivide.all.each do |rel|
      unless ItemSet.exists?(:rel_hero_divide_id => rel.id)
        set = ItemSet.new
        set.rel_hero_divide_id = rel.id
        set.created_by = 1
        set.updated_by = 1
        set.save
      end
    end
  end

  def self.rel_hero_divides
    Hero.all.each do |hero|
      Divide.all.each do |divide|
        unless RelHeroDivide.exists?({:hero_id => hero.id, :divide_id => divide.id})
          rel = RelHeroDivide.new
          rel.hero_id = hero.id
          rel.divide_id = divide.id
          rel.updated_by = 1
          rel.created_by = 1
          rel.save
        end
      end
    end
  end

  def self.rel_set_items
    ItemSet.all.each do |set|
      unless RelSetItem.where(:item_set_id => set.id).size() == 6
        for i in 1..6
          rel = RelSetItem.new
          rel.item_set_id = set.id
          rel.item_id = i
          rel.updated_by = 1
          rel.created_by = 1
          rel.save
        end
      end
    end
  end

  rel_hero_divides
  item_sets
  rel_set_items
end
