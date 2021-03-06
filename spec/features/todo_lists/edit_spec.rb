require 'spec_helper'

describe "Editing todo lists" do
	it "upadtes a todo list sucessfully with correct information " do
	todo_list = TodoList.create(title: "Groceries", description: "Grocery list.")

		visit "/todo_lists"
		within "#todo_list_#{todo_list.id}" do
			click_link "Edit"
		end
			
		fill_in "Title", with: "New title"
		fill_in "Description", with: "New description"
		click_button "Update Todo list"

		expect(page).to have_content("Todo list was successfully  updated")
		expect(todo_list.title).to eq("New title")
		expect(todo_list.description).to eq("New description")
	end	
end
