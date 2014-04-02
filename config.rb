###
# Blog settings
###

Time.zone = "US/Mountain"
set :markdown_engine, :redcarpet 
set :markdown, :fenced_code_blocks => true , 
    :smartypants => true , 
    :autolink => true 
activate :syntax
activate :directory_indexes
page "blog/*", :layout => :blog_layout
activate :blog do |blog|
  blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.sources = "blog/{year}-{month}-{day}-{title}.html"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  #blog.sources = "blog/{article-number}.html"
  #blog.permalink = "/{article-number}.html"

  # Enable pagination
   blog.paginate = true
   blog.per_page = 1
   blog.page_link = "{num}"
end

page "/feed.xml", layout: false

# ["tom", "dick", "harry"].each do |name|
#   proxy "/about/#{name}.html", "/about/template.html", :locals => { :person_name => name }, :ignore => true
# end

# data.blog_roll.comics.each do |comic|
#   proxy "", "", :locals => {:filename => filename}
# end
data.people.each do |fruit|
  proxy "/#{fruit.name}.html", "about/template.html", :locals => {:name => fruit.name, :price => fruit.price}, :ignore =>true
end

# Assumes the file source/about/template.html.erb exists
# (ruby command to get all the images).each do |filename, index|
#   proxy "/#{index}.html", "/blog/template.html", :locals => { :filename => filename }
# end

# Reload the browser automatically whenever files change
activate :livereload

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end
