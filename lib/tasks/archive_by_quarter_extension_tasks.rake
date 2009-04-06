namespace :radiant do
  namespace :extensions do
    namespace :archive_by_quarter do
      
      desc "Runs the migration of the Archive By Quarter extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          ArchiveByQuarterExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          ArchiveByQuarterExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Archive By Quarter to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[ArchiveByQuarterExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(ArchiveByQuarterExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
