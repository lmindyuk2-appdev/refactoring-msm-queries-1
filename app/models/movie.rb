# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  def director
    my_director_id = self.director_id

    matching_directors = Director.where({ :id => my_director_id })
    
    the_director = matching_directors.at(0)

    return the_director
  end

  def cast
    my_id = self.id
    matching_characters = Character.where({ :movie_id => my_id}) 
    array_actors = Array.new
    matching_characters.each do |a_character| 
      actor = Actor.where({ :id => a_character.actor_id })
      array_actors = array_actors.push(actor)
    end
    cast = array_actors
    return cast
  end

  def actors_names
    actors_names = Array.new
    self.cast.each do |an_actor|
      actors_names = actors_names.push(an_actor.at(0).name)
    end
    actors_names = actors_names.join(", ")
    return actors_names
  end

end
