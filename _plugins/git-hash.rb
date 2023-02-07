class GitHashGenerator < Jekyll::Generator
  safe true
  priority :low
  
  def initialize(...)
    super
    @git = if Dir.exist?('.git')
      { 'hash' => `git rev-parse --short HEAD`.strip }
    else
      nil
    end
  end
  
  def generate(site)
    site.data['git'] = @git
  end
end