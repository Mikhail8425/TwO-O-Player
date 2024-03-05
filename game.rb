require './question'
require './player'
require './turn'

class Game

  def initialize()
    setup_players()
    @current_player = @player1
    @player_alive = true
  end

  def setup_players
    puts "Player 1 name:"
    player1 = $stdin.gets.chomp.to_s
    @player1 = Player.new(player1)
    puts "Player 2 name:"
    player2 = $stdin.gets.chomp.to_s 
    @player2 = Player.new(player2)
    puts "#{player1} vs #{player2}! Answer correctly and live. Answer wrong 3 times and die! Let the game begin!"
  end

  def start_game 
    while @player_alive 
      new_turn()
      check_lives()
      switch_player()
    end
  end

  def new_turn
    turn = Turn.new(@current_player)
    turn.ask_question
  end

  def check_lives
    if @current_player.lives == 0
      @player_alive = false
      end_game()
    end
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else 
      @current_player = @player1
    end
  end

  def end_game
    switch_player()
    @winner= @current_player.name
    puts "CONGRATULATIONS! #{@winner}, you win the game!"
  end

end 