class Player
  def hand
    guides = %w(数字を入力してください。 0:\ グー 1:\ チョキ 2:\ パー)
    guides.each { |guide| puts guide }
    num = gets
    until num =~ /^[0-2]$/
      print "0~2の"
      guides.each { |guide| puts guide }
      num = gets
    end
    num.to_i
  end
end

class Enemy
  def hand
    rand(3)
  end
end

class Janken
  def hand_name_check(someone_hand)
    case someone_hand
    when 0
      "グー"
    when 1
      "チョキ"
    else
      "パー"
    end
  end

  def pon(player_hand, enemy_hand)
    enemy_hand_name = hand_name_check(enemy_hand)
    print "相手の手は#{enemy_hand_name}です。"
    result = (player_hand - enemy_hand + 3) % 3
    case result
    when 2
      puts "あなたの勝ちです。"
    when 1
      puts "あなたの負けです。"
    else
      print "引き分けです。\n再度、"
      player = Player.new
      enemy = Enemy.new
      self.pon(player.hand, enemy.hand)
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

janken.pon(player.hand, enemy.hand)
