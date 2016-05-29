require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def three_or_more(a, no)
  return a.count(no) >= 3
end

def three_ones(a)
  return three_or_more(a,1)
end

def check_ones ones

    sum = 0
    if ones >= 3
      sum = 1000
      ones-= 3
    end
      
    sum+= ones * 100
    
    #puts "returns #{sum}"
    return sum  
end

def check_others key, val
    sum = 0
    if val >= 3
      sum = 100 * key 
      val-= 3
    end
      
    sum+= val * 10 * key  if key == 5 and val > 0
    
    #puts "returns #{sum}"
    return sum    

end

def get_quantas dice

    quanta = Hash.new(0)

    dice.each do | d | quanta[d]+=1 end

    sum =  check_ones quanta[1]
    
    sum = 100 
end

def score2(dice)

  puts dice

  sum+= check_ones dice.count(1)

  sum+= check_others  2, dice.count(2)

  sum+= check_others  3, dice.count(3)
  
  sum+= check_others  4, dice.count(4)

  sum+= check_others  5, dice.count(5)

  sum+= check_others  6, dice.count(6)
  
  return sum

end

def score(dice)

  sum = 0
  dice.sort!
  
  return 0 if dice.empty?

  quanta = Hash.new(0)

  dice.each do | d | quanta[d]+=1 end

  #puts '*' * 70

  sum+= check_ones quanta[1]

  sum+= check_others  2, quanta[2]

  sum+= check_others  3, quanta[3]
  
  sum+= check_others  4, quanta[4]

  sum+= check_others  5, quanta[5]

  sum+= check_others  6, quanta[6]
  
  return sum

  #sum+= 1000 if three_ones(dice)

  #sum+= 500 if three_or_more(dice,?)


  #return 10 * dice.first if [2,3,4,5,6].include?(dice.first)

  #return 100 if dice.first == 1

end

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
    assert_equal 1100, score([1,1,1,1])
    assert_equal 1200, score([1,1,1,1,1])
    assert_equal 1150, score([1,1,1,5,1])
  end

end
