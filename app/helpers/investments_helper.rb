module InvestmentsHelper
  def set_money
    @candidates=Candidate.all.order(:id)
    @candidates.each do |candidate|
      @investments = candidate.investments
      @investments.each do |investment|
        candidate.money += investment.money
      end
    end
  end

  def set_liking
    @candidates=Candidate.all.order(:id)
    @candidates.each do |candidate|
      @likes = candidate.likes
      @likes.each do |like|
        candidate.liking += 1
      end
    end
  end 
end
