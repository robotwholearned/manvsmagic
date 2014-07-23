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
  #blog.tag_template = "tag.html"
  #blog.calendar_template = "calendar.html"
  #blog.sources = "blog/{article-number}.html"
  #blog.permalink = "/{article-number}.html"

  # Enable pagination
   blog.paginate = true
   blog.per_page = 1
   blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

data.blog_roll.each do |comic|
  proxy "/#{comic.number}.html", "/comic.html", :locals => {:comic => comic}, :ignore =>true
end
# Reload the browser automatically whenever files change
activate :livereload

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

#sitemap
activate :sitemap, :hostname => "http://www.manvsmagic.com"

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  #activate :imageoptim
end
