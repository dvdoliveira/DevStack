class UserStackScore
  include Interactor

  def call
    score_calc(context.user)
  end

  def down_count_score(down_value)
    if down_value <= 1
      @total_score-= 1
    elsif down_value > 1 && down_value < 5
      @total_score-= 2
    elsif down_value >= 5 && down_value <10
      @total_score-= 4
    elsif down_value >= 10 && down_value <50
      @total_score-= 7
    else
      @total_score-= 10
    end
  end

  def up_count_score(up_value)
    if up_value >= 200
      @total_score+= 10
    elsif up_value >= 50 && up_value < 200
      @total_score+= 7
    elsif up_value >= 10 && up_value < 50
      @total_score+= 4
    elsif up_value >= 5 && up_value < 10
      @total_score+= 2
    else
      @total_score+= 1
    end
  end

  def answer_score(answer_value)
    if answer_value >= 200
      @total_score+= 20
    elsif answer_value >= 50 && answer_value < 200
      @total_score+= 14
    elsif answer_value >= 10 && answer_value < 50
      @total_score+= 8
    elsif answer_value >= 3 && answer_value < 10
      @total_score+= 4
    else
      @total_score+= 1
    end
  end

  def reputation_score(reputation_value)
    if reputation_value >=500
      @total_score+= 20
    elsif reputation_value>=200 && reputation_value<500
      @total_score+= 14
    elsif reputation_value>=100 && reputation_value<200
      @total_score+= 8
    elsif reputation_value>=50 && reputation_value<100
      @total_score+= 4
    else
      @total_score+= 1
    end
  end

  def score_calc(user)
    @total_score = 0
    @user = User.find_by(id: user.id)
    current_user = StackUser.find_by(user_id: user.id)
    @down_vote_count_value = current_user.down_vote_count
    @up_vote_count_value = current_user.up_vote_count
    @answer_count_value = current_user.answer_count
    @reputation_value = current_user.reputation
    down_count_score(@down_vote_count_value)
    up_count_score(@up_vote_count_value)
    answer_score(@answer_count_value)
    reputation_score(@reputation_value)
    user_previous_score = @user.user_score
    @user.update_attribute(:user_score,@total_score+user_previous_score)
    update_user_level(@user)

    Statistic.create(
      user_id: @user.id,
      score: @down_vote_count_value,
      score_type: "so_down_vote"
    )

    Statistic.create(
      user_id: @user.id,
      score: @up_vote_count_value,
      score_type: "so_up_vote"
    )

    Statistic.create(
      user_id: @user.id,
      score: @answer_count_value,
      score_type: "so_answer_count"
    )

    Statistic.create(
      user_id: @user.id,
      score:  @reputation_value ,
      score_type: "so_reputation_count"
    )

  end
  
  def update_user_level(user)
    case user.user_score
    when 1..20
      @user.update user_level: "Apprentice"
    when 21..40
      @user.update user_level: "Enthusiast"
    when 41..70
      @user.update user_level: "Creator"
    when 71..90
      @user.update user_level: "Collaborator"
    else
      @user.update user_level: "Guru"
    end
  end

# context.value  = context.total_score
end
