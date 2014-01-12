class Ecom::InstallGenerator < ::Rails::Generators::Base
  include Rails::Generators::Migration
  desc "Installs Ecom Store"

  def install
    copy_file "../../../../config/locales/devise.en.yml", "config/locales/devise.en.yml"    
    copy_file "../../../../config/locales/en.yml", "config/locales/ecom.en.yml"
    route 'mount Ecom::Engine => "/store"'
  end
end
