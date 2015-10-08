class String
  alias_method :constantize_without_heuristic, :constantize

  def constantize(heuristically: false)
    if heuristically
      constantize_with_heuristic
    else
      constantize_without_heuristic
    end
  end

  def constantize_with_heuristic
    singularize.titleize.gsub(/\s/, '').constantize
  end
end