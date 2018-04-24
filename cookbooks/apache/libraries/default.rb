def index_exists?
  ::File.exists?("/var/www/html/index.html")
end
