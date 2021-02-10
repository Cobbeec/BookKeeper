module BooksHelper
    def display_header(author) #if we set a brand in our controller
        if @author
            tag.h2("All the #{@author.name} Books")
        else 
            tag.h1("All the books")
    end
end 

end
