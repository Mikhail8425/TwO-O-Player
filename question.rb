class Question
  attr_reader :correct_answer, :num1, :num2, :player_answer

  def initialize()
    @num1 = rand(1..99)
    @num2 = rand(1..99)
    @correct_answer = num1 + num2
  end

  def new_question
    puts "What is #{num1} plus #{num2}?"
    @player_answer = $stdin.gets.chomp.to_i
    puts "The correct answer is #{correct_answer}"
  end
  
  def check_answer()
    if @player_answer == correct_answer
      puts "Your answer is correct. You live to see another day!"
      return true
    end
    puts "Wrong! You lose a life"
    return false
  end 
end