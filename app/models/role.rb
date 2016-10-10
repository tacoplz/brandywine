class Role < ActiveRecord::Base
  #relationship between Role model and Users via foreign_key role_id
  has_many :users, :dependent => :destroy

  def self.userroles
    Role.all.map { |role| [role.role_name]}
  end
  
end
