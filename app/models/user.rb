class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         has_many :items
         has_many :buyers

         validates :nickname,          presence: true
         validates :last_name_kanji,   presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください'}
         validates :first_name_kanji,  presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください'}
         validates :last_name_kana,    presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナで入力してください'}
         validates :first_name_kana,   presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナで入力してください'}
         validates :birthday,          presence: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
