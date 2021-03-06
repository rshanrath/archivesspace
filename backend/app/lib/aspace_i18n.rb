require 'i18n'
require 'aspace_i18n_enumeration_support'

I18n.enforce_available_locales = false # do not require locale to be in available_locales for export
I18n.load_path += ASUtils.find_locales_directories(File.join("enums", "#{AppConfig[:locale]}.yml"))

# Allow overriding of the i18n locales via the 'local' folder(s)
ASUtils.wrap(ASUtils.find_local_directories).map{|local_dir| File.join(local_dir, 'frontend', 'locales')}.reject { |dir| !Dir.exists?(dir) }.each do |locales_override_directory|
  I18n.load_path += Dir[File.join(locales_override_directory, '**' , '*.{rb,yml}')]
end


module I18n

  def self.t(*args)
    self.t_raw(*args)
  end

end
