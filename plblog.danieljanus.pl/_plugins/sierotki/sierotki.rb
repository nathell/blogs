require 'octopress-hooks'

module Octopress
  module Sierotki
    def self.sierotkize(content)
      content.gsub(/(\b\p{L}) /, '\1&nbsp;')
    end

    class PageHook < Hooks::Page
      def pre_render(page)
        page.content = Octopress::Sierotki::sierotkize(page.content)
      end
    end

    class PostHook < Hooks::Post
      def pre_render(post)
        # post.content = Octopress::Sierotki::sierotkize(post.content)
        # commented out until I figure out how to prevent it from messing with code snippets
        post.data['title_html'] = Octopress::Sierotki::sierotkize(post.title)
        post.data['excerpt'] = Octopress::Sierotki::sierotkize(post.excerpt)
        post.data['title_link'] = Octopress::Linkblog.post_title_link(post.data)
      end
    end

    class DocumentHook < Hooks::Document
      def pre_render(document)
        document.content = Octopress::Sierotki::sierotkize(document.content)
      end
    end
  end
end
