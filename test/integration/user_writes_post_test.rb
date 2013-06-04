require 'test_helper'
class UserWritesPostTest < ActionDispatch::IntegrationTest
# class AnonymousPostsArticleTest < ActionDispatch::IntegrationTest
  test "view a list of articles" do
    Post.create!(title: "First Post!!", body: "This is awkward... I have nothing to say :(")
    Post.create!(title: "Wow, it's been a while!", body: "And yet, I'm still not a writter :( :( lolol")
    assert_equal 2, Post.count
    visit '/posts'
    sleep 1
    # click_link "View All Posts"
   
    # assert_current_path '/posts'
    assert_include page.body, "All Posts"
    assert_include page.body, "First Post!!"
    #=> assert page.content.include? "First Post!!"
    assert_include page.body, "Wow, it's been a while!"
  end
end

# class UserWritesPostTest < ActionDispatch::IntegrationTest
#     test "count article" do 
# 	    Post.create(title: "First Post", body: "first")
# 	    Post.create(title: "Wow, its been a while", body: "but still not a writer")  
# 	    assert_equal 2, Post.all.size
#     end 

#     test "browse articles" do 
#         Post.create(title: "First Post", body: "first")
# 	    Post.create(title: "Wow, its been a while", body: "but still not a writer")  
# 	    assert_equal 2, Post.all.size
# 	    visit '/posts'
# 	    # assume we have a page variable 
# 	    # assert page.has_content? "First Post"
# 	    assert_include page.body, "First Post"
# 	    assert_include page.body, "Wow, its been a while"
#     end 
# end
