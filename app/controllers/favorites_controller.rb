class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    # favorite = Favorite.new(book_id: book.id)
    # book.user_id = current_user.id
    favorite.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = book.favorites.find_by(user_id: current_user.id)
    # favorite = current_user.favorites.find_by(book_id: book.id)でもいい
    favorite.destroy
    redirect_to request.referer
  end
end
