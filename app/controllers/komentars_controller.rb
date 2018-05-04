class KomentarsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @komentar = @post.komentars.create(komentar_params)
        redirect_to article_path(@article)
      end

      def destroy
        @post = Post.find(params[:post_id])
        @komentar = @post.komentars.find(params[:id])
        @komentar.destroy
        redirect_to post_path(@post)
      end
     
      private
        def komentar_params
          params.require(:komentar).permit(:ime, :tekst)
        end

end
