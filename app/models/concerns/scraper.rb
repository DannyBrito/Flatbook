class Scraper

    def self.search(arg1, arg2)
        uri = URI("https://www.google.com/search?tbm=isch&q=#{arg1}+#{arg2}")
        html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
        return html_doc.css("a > img")["#{rand(0..3)}".to_i].attr('src')
    end

    def self.post(arg1)
        b_format = arg1.strip.split(" ").join("+")
        uri = URI("https://www.google.com/search?tbm=isch&q=#{b_format}+&imagesize:400x400")
        html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
        if html_doc.css("a > img")["#{rand(0..3)}".to_i]
            return html_doc.css("a > img")["#{rand(0..3)}".to_i].attr('src')
        else
            return "data:image/png;base64,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"
        end
    end

end