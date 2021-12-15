class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :family_name, :first_name, :family_name_kana,
            :first_name_kana, :birthday, presence: true
  # パスワードは半角英数字混合必須
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, allow_blank: true	
  # 名前は全角漢字・ひらがな・カタカナいずれか
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }, allow_blank: true
  # カナは全角カタカナのみ
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true

end
