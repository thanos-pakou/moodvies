from django.conf.urls import url, include
from django.contrib import admin
from . import views

app_name = 'mdvapp'

urlpatterns = [
    url(r'^movie/?$', views.MovieList.as_view()),
    url(r'^movie/(?P<pk>[0-9]+)/?$', views.MovieDetail.as_view()),
    url(r'^genre/(?P<pk>[0-9]+)/?$', views.GenreDetail.as_view()),
    url(r'^genre/?$', views.GenreList.as_view()),
    url(r'^actor/?$', views.ActorList.as_view()),
    url(r'^actor/(?P<pk>[0-9]+)/?$', views.ActorDetail.as_view()),
    url(r'^director/?$', views.DirectorList.as_view()),
    url(r'^director/(?P<pk>[0-9]+)/?$', views.DirectorDetail.as_view()),
    url(r'^mood/?$', views.MoodList.as_view()),
    url(r'^mood/(?P<pk>[0-9]+)/?$', views.MoodDetail.as_view()),
    url(r'^review/?$', views.ReviewList.as_view()),
    url(r'^review/(?P<pk>[0-9]+)/?$', views.ReviewListDetail.as_view()),
    url(r'^review-like/?$', views.ReviewLike.as_view()),
    url(r'^review-like/(?P<pk>[0-9]+)/?$', views.ReviewLikeModify.as_view()),
    url(r'^movie-list/?$', views.UserMovieList.as_view()),
    url(r'^movie-list/?(?P<pk>[0-9]+)/?$', views.UserMovieListDetail.as_view()),
    url(r'^user/?$', views.User.as_view()),
    url(r'^rating/?$', views.Rating.as_view()),
    url(r'^ip-address/?$', views.IpAddressList.as_view()),
    url(r'^feedback/?$', views.FeedbackList.as_view()),
    url(r'^feedback/?(?P<pk>[0-9]+)/?$', views.FeedbackListDetail.as_view()),




]
