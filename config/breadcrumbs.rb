crumb :root do
  link "Home", root_path
end

crumb :plan_search do
  link "検索結果ページ", search_plans_path
  parent :root
end

crumb :plan_show do |plan|
  link "「#{plan.name}」の計画詳細", plan_path(params[:id])
  parent :root
end

crumb :plan_new do
  link "計画提案ページ",plans_path
  parent :root
end

crumb :plan_edit do |plan|
  link "計画編集ページ",edit_plan_path(plan.id)
  parent :plan_show, plan
end

crumb :following_show do |current_user|
  link "「#{current_user.nickname}さん」のフォローの一覧ページ", followings_user_path(current_user.id)
  parent :root
end

crumb :follower_show do |current_user|
  link "「#{current_user.nickname}さん」のフォロワーの一覧ページ", followers_user_path(current_user.id)
  parent :root
end

crumb :favorite_list do
  link "「#{current_user.nickname}」さんのお気に入り一覧",favorites_user_path(current_user.id)
  parent :root
end

crumb :user_registration do
  link "新規登録",new_user_registration_path
  parent :root
end

crumb :user_login do
  link "ログイン",new_user_session_path
  parent :root
end

crumb :my_page do |user|
  link "マイページ",user_path(current_user.id)
  parent :root
end

crumb :user_page do |user|
  link "ユーザーページ",user_path(user.id)
  parent :root
end

crumb :user_edit do |user|
  link "ユーザー編集ページ",edit_user_path(user.id)
  parent :user_page,user
end


crumb :about do
  link "概要",about_plans_path
  parent :root
end




# crumb :contacts do
#   link "フォロー中リスト", contacts_index_path
#   parent :tweets
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).