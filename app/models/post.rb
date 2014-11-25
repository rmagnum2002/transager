class Post < ActiveRecord::Base
  scope :carrier, -> {where post_type: 1}

  POST_TYPE = {
    :"post_type.job_offer" => 1
  }

  def created_date
    self.created_at.strftime("%d")
  end

  def created_month
    self.created_at.strftime("%B").first(3)
  end

  def to_param
    "#{id}-#{title}".parameterize
  end
end
