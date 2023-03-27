class Hash
  def resolve(value)
    return resolve_for_int_str(value) if value.class == Integer
    return resolve_for_str_int(value)
  end

  private
  def resolve_for_int_str(number)
    (self[number].nil?)? '' : self[number]
  end

  def resolve_for_str_int(words)
    self[words]
  end
end
