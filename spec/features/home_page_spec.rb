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
        expect(page).to have_content('Start Fresh')
      end

      it "does not have a random button" do
        visit '/'
        expect(page).to_not have_content('Random')
      end
    end

    context 'with sketches in the database' do
      before(:each) {
        tree1 = Tree.create()
        tree2 = Tree.create()
        tree1.sketches += [Sketch.new, Sketch.new, Sketch.new]
        tree2.sketches += [Sketch.new, Sketch.new, Sketch.new]
      }

      it "has a nav bar with buttons" do
        visit '/'
        expect(page).to have_content('Eversketch')
        expect(page).to have_content('Sign Up')
        expect(page).to have_content('Sign in with Google')
        expect(page).to have_content('Log In')
      end

      it "has a start fresh button" do
        visit '/'
        expect(page).to have_content('Start Fresh')
      end

      it "has a random button" do
        visit '/'

        expect(page).to have_content('Random')
      end
    end
  end

  context 'when logged in' do
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
        expect(page).to have_content('Start Fresh')
      end

      it "does not have a random button" do
        visit '/'
        expect(page).to_not have_content('Random')
      end
    end

    context 'with sketches in the database' do
      before(:each) {
        tree1 = Tree.create()
        tree2 = Tree.create()
        tree1.sketches += [Sketch.new, Sketch.new, Sketch.new]
        tree2.sketches += [Sketch.new, Sketch.new, Sketch.new]
      }

      it "has a nav bar with buttons" do
        visit '/'
        expect(page).to have_content('Eversketch')
        expect(page).to have_content('Sign Up')
        expect(page).to have_content('Sign in with Google')
        expect(page).to have_content('Log In')
      end

      it "has a start fresh button" do
        visit '/'
        expect(page).to have_content('Start Fresh')
      end

      it "has a random button" do
        visit '/'

        expect(page).to have_content('Random')
      end
    end
  end
end
