# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  def characters 
    my_id = self.id

    characters = Character.where({ :actor_id => my_id })
    return characters
  end

  def filmography
    my_id = self.characters.movie_id
    matching_movies = Movie.where({ :id => my_id}) 

    matching_movies = matching_movies.at(0)

    return matching_movies

  end

end
