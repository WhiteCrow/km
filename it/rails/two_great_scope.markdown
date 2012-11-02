  class Post < ActiveRecord::Base
       scope :matching, lambda { | column, value | 
              return { } if value.blank?
              { :conditions => ["#{column} like ? ", "%#{value}%"] }
       }

       scope :order, lambda { | order | 
              {:order => case order
                       when "title" : "title desc"
                       when "created_at" : "created_at"
              }
       }

  end

controller codes:

  def search 
      @posts = Post.matching(:title, params[:title])
                           .matching(:title, params[:title])
                           .order(params[:order])

  end
