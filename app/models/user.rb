class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true, format: { with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' },
               length: { minimum: 6 }, confirmation: true do
    validates :password
  end

  with_options presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false } do
    validates :email
  end

  with_options presence: true,
               format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/,
                         message: 'is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :date_of_birth, presence: true
end
