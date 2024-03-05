require './question'
require './player'

class Turn 

  def initialize(player)
    @new_question = Question.new()
    @current_player = player
  end

  def ask_question
    puts "#{@current_player.name}'s turn"
    @new_question.new_question
    if !@new_question.check_answer
       @current_player.lost_life 
       puts "#{@current_player.lives}/3 lives remaining"
    end
  end
  
end