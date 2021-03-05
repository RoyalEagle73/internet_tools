require 'rdoc/task'

task :test do
    sh "rspec -f documentation" 
end

RDoc::Task.new do |rdoc|
    rdoc.main = "README.rdoc"
    rdoc.rdoc_files.include("README.rdoc", "lib/*")
    rdoc.rdoc_dir = 'documentation'
end

task :build_gem do
    Rake::Task[:test].execute
    sh "gem build internet_tools.gemspec"
end