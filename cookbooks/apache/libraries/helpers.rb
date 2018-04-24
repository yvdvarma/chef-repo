module ApacheCookbook
#  module Helpers
    def platform_package_httpd
      case node['platform']
      when 'centos' then 'httpd'
      when 'ubuntu' then 'apache2'
      end
    end

    def platform_service_httpd
      case node['platform']
      when 'centos' then 'httpd'
      when 'ubuntu' then 'apache2'
      end
    end
#  end
end
Chef::Recipe.send(:include, ApacheCookbook)
Chef::Resource.send(:include, ApacheCookbook)
Chef::Provider.send(:include, ApacheCookbook)
