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
  
  # Enable pagination
   blog.paginate = true
   blog.per_page = 1
   blog.page_link = "{num}"
end

page "/feed.xml", layout: false

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
 # proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
  # which_fake_page: "Rendering a fake page with a local variable" }

["tom", "dick", "harry"].each do |name|
  proxy "/about/#{name}.html", "/about/template.html", :locals => { :person_name => name }, :ignore => true
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
 activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

ready do
  sitemap.resources.group_by {|p| p.data["category"] }.each do |category, pages|
    proxy "/categories/#{category}.html", "category.html", 
      :locals => { :category => category, :pages => pages }
  end
end
