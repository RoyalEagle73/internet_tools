Gem::Specification.new do |x|

    #Required attributes
    x.name = "internet_tools"
    x.version = "0.1.0"
    x.summary = "A tool for implementing internet tools in ruby projetcs"
    x.authors = ["Deepak Chauhan"]
    x.files = ['lib/internet_tools.rb','LICENSE','Rakefile','README.rdoc','spec/internet_tools_spec.rb']


    # Additional attributes for quality
    x.description = "A tool for that allows you to use system internet tools in your ruby project."
    x.email = "deepakchauhan878@gmail.com"
    x.homepage = "https://github.com/royaleagle73/internet_tools"
    #Dependencies
    x.add_runtime_dependency 'rspec', '~>0.0'
    x.licenses = ["MIT"]

end