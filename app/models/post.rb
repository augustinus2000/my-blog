class Post < ApplicationRecord
  has_rich_text :body
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  # ✅ 카테고리 목록을 ENUM으로 관리
  CATEGORIES = ["Tech", "Life", "Notice"]
  validates :category, inclusion: { in: CATEGORIES }

  # ✅ HTML 자동 렌더링 (뷰에서 raw 사용 권장)
  def formatted_body
    body.to_s.html_safe
  end
end
