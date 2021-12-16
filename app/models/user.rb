class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, :family_name, :first_name, :family_name_kana,
            :first_name_kana, :birthday, presence: true
  # パスワードは半角英数字混合必須・半角のみ
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, allow_blank: true
  # 名前は全角漢字・ひらがな・カタカナいずれか
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }, allow_blank: true
  # カナは全角カタカナのみ
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }, allow_blank: true
end
