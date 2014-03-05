require 'spec_helper'

describe 'home page' do

  context 'when logged out' do
    context 'with no sketches in the database' do
      it "has a nav bar with buttons"
      it "has a start fresh button" do
        visit '/'
        page.has_content?('Start Fresh')
      end
    end

  end


end
