crumb :root do
  link "FURIMA", root_path
end

crumb :parent do
  item = Item.find_by(id: params[:id])
  grandchild = Category.find_by(id: item.category_id)
  child = grandchild.parent
  parent = child.parent
  link "#{parent.name}", root_path
end

crumb :child do
  item = Item.find_by(id: params[:id])
  grandchild = Category.find_by(id: item.category_id)
  child = grandchild.parent
  link "#{child.name}", root_path
  parent :parent
end

crumb :grandchild do
  item = Item.find_by(id: params[:id])
  grandchild = Category.find_by(id: item.category_id)
  link "#{grandchild.name}", root_path
  parent :child
end

crumb :item do |item|
  link "#{item.title}", item_path(item)
  parent :grandchild
end


crumb :user do
  link "ユーザー一覧", root_path
end

crumb :mypage do |user|
  link "マイページ", root_path
end


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