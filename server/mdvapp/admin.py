from django.contrib import admin

from .models import Movie, Actor, Director, Genre, Mood, Review, RatingMovie, ReviewLike, UserMovieListComment,\
    UserMovieList, UserMovieListLike, IPAddress, Feedback

admin.site.register(Movie)
admin.site.register(Actor)
admin.site.register(Director)
admin.site.register(Genre)
admin.site.register(Mood)
admin.site.register(Review)
admin.site.register(RatingMovie)
admin.site.register(ReviewLike)
admin.site.register(UserMovieListComment)
admin.site.register(UserMovieList)
admin.site.register(UserMovieListLike)
admin.site.register(IPAddress)
admin.site.register(Feedback)
