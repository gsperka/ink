require 'spec_helper'

describe 'home page' do

  context 'when logged out' do
    context 'with no sketches in the database' do
      it "has a nav bar with buttons" do
        visit '/'
        expect(page).to have_content('Eversketch')
        expect(page).to have_content('Sign Up')
        expect(page).to have_content('Sign in with Google')
        expect(page).to have_content('Log In')
      end

      it "has a start fresh button" do
        visit '/'
        page.has_content?('Start Fresh')
      end
    end

  end


end
