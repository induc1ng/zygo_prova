require 'rails_helper'
require 'faker'

RSpec.describe Book, :type => :model do
    context "admin" do
        it "is the only one who can create delete or destroy" do
            user = User.create! :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :admin => 1
            redirect_to_books_url
            expect(page).to have_link('./books', href: root_path, count: 1)
        end
    end
end