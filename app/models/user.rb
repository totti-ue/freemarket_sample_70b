class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  
  has_many :addresses
  has_many :cards
  has_many :items
  has_many :buyer_transactions, class_name: 'Transaction', :foreign_key => 'buyer_id'
  has_many :seller_transactions, class_name: 'Transaction', :foreign_key => 'seller_id'
  has_many :sns_credentials


  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /[ぁ-んァ-ンａ-ｚＡ-Ｚ一-龥]+/ }
  validates :first_name, presence: true, format: { with: /[ぁ-んァ-ンａ-ｚＡ-Ｚ一-龥]+/ }
  validates :last_name_kana, presence: true, format: { with: /[ァ-ン]+/ }
  validates :first_name_kana, presence: true, format: { with: /[ァ-ン]+/ }
  validates :birthday, presence: true
end
