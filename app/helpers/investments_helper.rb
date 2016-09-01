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
end
