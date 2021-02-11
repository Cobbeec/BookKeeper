module BooksHelper
    def display_header(author) #if we set a brand in our controller
        if @author
            tag.h2("All the #{@author.name} Books")
        else 
            tag.h1("All the books")
    end
end 

    def display_authors_fields(t) 
        if params[:author_id]
            t.hidden_field :author_id 
    #     else 
    #         render partial: 'author_select' , locals: {f: t}
    end 
    end 

    def display_nested_header 
        if params[:author_id]
            "Create a new #{@author.name} book"
        else 
            "Create New Book"
        end 
    end 
end
