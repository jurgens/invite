class Invitation < ActiveRecord::Base
  attr_accessible :email
  before_save :generate_link
  validates_presence_of :email  

  def self.valid?(link)
  	invite=find_by_link(link)
  	if invite && User.find_by_email(invite.email).blank?
  end	


  private

  	def generate_link
  		letters =  [('0'..'9'),('a'..'f')].map{|i| i.to_a}.flatten
		self.link=(0...128).map{ letters[rand(letters.length)] }.join
  	end	


end
