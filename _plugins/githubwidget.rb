module Jekyll
  class GithubRepo < Liquid::Tag

    def initialize(name, repository, tokens)
      super
      @repository = repository.strip

    end

    def render(context)
		%(
<script src="/assets/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/assets/jquery.githubRepoWidget.min.js"></script>
<div class="github-widget" data-repo="#{@repository}"></div>
		)
    end
  end
end

Liquid::Template.register_tag('githubrepo', Jekyll::GithubRepo)

