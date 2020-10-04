module ReviewsHelper

    def display_header(review)
        if params[:ice_cream_id]
            content_tag(:h1, "Add a Review for #{review.book.title} -  #{review.book.author.name}")
        else
          content_tag(:h1, "Create a review")
        end
      end
end
