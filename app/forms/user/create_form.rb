class User::CreateForm
  include ActiveModel::Model

  attr_accessor :username, :password, :email

  validates :username, :password, :email, presence: true
  validates :password, length: { minimum: 8, maximum: 15 }

  def save
    return false unless valid?

    @user = User.new(username: username, password: password, email: email)
    @user.save
  end

  def user
    @user
  end
end
