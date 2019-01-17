from django.contrib import admin

from .models import Movie, Actor, Director, Genre, Images, Mood, Review, RatingMovie, ReviewLike, UserMovieListComment, \
    UserMovieList, UserMovieListLike

admin.site.register(Movie)
admin.site.register(Actor)
admin.site.register(Director)
admin.site.register(Genre)
admin.site.register(Mood)
admin.site.register(Images)
admin.site.register(Review)
admin.site.register(RatingMovie)
admin.site.register(ReviewLike)
admin.site.register(UserMovieListComment)
admin.site.register(UserMovieList)
admin.site.register(UserMovieListLike)