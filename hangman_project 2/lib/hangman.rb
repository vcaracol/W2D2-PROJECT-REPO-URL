class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def DICTIONARY
    array
  end

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) { "_" }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |e, i|
      if char == e
        arr << i
      end
    end
    arr
  end

  def fill_indices(char, array)
    array.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print "that has already been attempted"
      return false
    else
      @attempted_chars << char
      if self.get_matching_indices(char).empty?
        @remaining_incorrect_guesses -= 1
      else
        newarr = self.get_matching_indices(char)
        self.fill_indices(char, newarr)
      end
      return true
    end
  end

  def ask_user_for_guess
    print "Enter a char:"
    response = gets.chomp
    return self.try_guess(response)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      print @secret_word
      return true
    else
      return false
    end
  end
end
