class CatalogController < ApplicationController
before_filter :initialize_cart
  def index
	@page_title = "Kleitu saraksts"
	@books = Book.paginate(:page => params[:page], :per_page => 10)
	.order("books.id desc")
end

  def show
	@book = Book.find(params[:id]) rescue nil
	return render(:text => "Not found", :status => 404) unless @book
	@page_title = @book.title
end

  def search
  end

  def latest
@page_title = "Jaunākās kleitas"
@books = Book.latest
end
end
