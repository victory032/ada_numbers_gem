class Integer
  extend AdaNumbers
  def number_of_digits
    self.to_s.size
  end

  def category
    case self.number_of_digits
    when 2
      return AdaNumbers::NumberCategory::TEN
    when 3
      return AdaNumbers::NumberCategory::HUNDRED
    when 4..6
      return AdaNumbers::NumberCategory::THOUSAND
    when 7..9
      return AdaNumbers::NumberCategory::MILLION
    when 10..12
      return AdaNumbers::NumberCategory::THOUSAND_MILLIONS
    when 13..15
      return AdaNumbers::NumberCategory::BILLION
    end

    AdaNumbers::NumberCategory::UNITY
  end

  def bridge
    n_digits = self.number_of_digits

    case n_digits
    when 5, 8, 11, 14
      return 2
    when 6, 9, 12, 15
      return 3
    end

    return 1
  end
end

