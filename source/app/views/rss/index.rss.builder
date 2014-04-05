xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0",
        :'xmlns:content' => 'http://purl.org/rss/1.0/modules/content/',
        :'xmlns:wfw' => 'http://wellformedweb.org/CommentAPI/',
        :'xmlns:dc' => 'http://purl.org/dc/elements/1.1/',
        :'xmlns:atom' =>'http://www.w3.org/2005/Atom',
        :'xmlns:sy' => 'http://purl.org/rss/1.0/modules/syndication/',
        :'xmlns:slash' => 'http://purl.org/rss/1.0/modules/slash/' do
    xml.channel do
        xml.title "小镇树妖的IT实验室"
        xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => 'http://www.jacky-wu.com/rss'
        xml.description "Focus on Java, Python, Android, Web(HTML5,CSS,PHP,MySQL) base on Linux and FreeBSD"
        xml.link "http://www.jacky-wu.com"
        xml.language "zh-cn"
        xml.copyright "Jacky Wu"
        for post in @posts
            xml.item do
                xml.link post_url(post)
                xml.title post.title
                xml.author "ecstorm@gmail.com (Jacky Wu)"
                xml.category post.category.title
                xml.pubDate post.created_at.to_s(:rfc822)
                xml.guid post_url(post)
                xml.description post.content_md
            end
        end
    end
end