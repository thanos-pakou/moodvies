import jwt
from django.db.models import Q, Count, Avg
from django.http import request, JsonResponse
from rest_framework.response import Response
from rest_framework_jwt.serializers import jwt_payload_handler

from moodvies_project import site_config
from .models import Movie, Actor, Mood, Genre, Director, Review, UserMovieList as UserMovieListModel, UserMovieListLike, \
    UserMovieListComment, RatingMovie, CustomUser, ReviewLike as ReviewLikeModel, IPAddress, Feedback
from .serializers import MovieSerializer, ActorSerializer, MoodSerializer, GenreMoviesSerializer, GenreSerializer, \
    ActorMoviesSerializer, DirectorSerializer, DirectorMoviesSerializer, MoodMoviesSerializer, MoviesReviewsSerializer, \
    ReviewSerializer, UserMovieListSerializer, UserSerializer, RatingMovieSerializer, UserSearchSerializer, \
    ReviewLikeSerializer, ReviewListLikeSerializer, IpAddressSerializer, FeedbackSerializer, IpActorSerializer, \
    IpDirectorSerializer, IpMovieSerializer, UserNoPwSerializer

from django.contrib.auth.models import User
from rest_framework import generics, viewsets, status
from django.db import connection

from rest_framework import permissions

from django.contrib.staticfiles import views
cursor = connection.cursor()


def index(request, path=''):
    if path.endswith('.js'):
        return views.serve(request, path)
    else:
        return views.serve(request, 'index.html')


class MovieList(generics.ListCreateAPIView):
    serializer_class = MovieSerializer

    def get_queryset(self):
        queryset = Movie.objects.all().annotate(visits_count=Count('visit')).order_by('-visits_count')
        search = self.request.query_params.get('search', None)
        top20_imdb = self.request.query_params.get('top20_imdb', None)
        top20 = self.request.query_params.get('top20', None)
        recommended = self.request.query_params.get('rec', None)
        if top20_imdb is not None:
            queryset = Movie.objects.all().order_by('-imdb_score')[:20]
        if top20 is not None:
            queryset = Movie.objects.all().annotate(rating=Avg('ratingmovie__rating')).order_by('-rating')[:20]
        if search is not None:
            queryset = queryset.filter(search_field__icontains=search)
        if recommended is not None:
            queryset = queryset.filter(recommended=True)
        return queryset


class MovieListUpdate(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = IpMovieSerializer
    queryset = Movie.objects.all()


class GenreDetail(generics.RetrieveUpdateDestroyAPIView):

    queryset = Genre.objects.all()
    serializer_class = GenreMoviesSerializer


class GenreList(generics.ListCreateAPIView):
    queryset = Genre.objects.all()
    serializer_class = GenreSerializer


class IpAddressList(generics.ListCreateAPIView):
    serializer_class = IpAddressSerializer

    def get_queryset(self):
        queryset = IPAddress.objects.all()
        spec_ip = self.request.query_params.get('spec_ip', None)
        if spec_ip is not None:
            queryset = queryset.filter(ip=spec_ip)
        return queryset


class ActorList(generics.ListCreateAPIView):
    serializer_class = ActorSerializer

    def get_queryset(self):
        queryset = Actor.objects.all().annotate(visits_count=Count('visit')).order_by('-visits_count')
        search = self.request.query_params.get('search', None)
        if search is not None:
            queryset = queryset.filter(search_field__icontains=search)
        return queryset


class ActorDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Actor.objects.all()
    serializer_class = ActorMoviesSerializer


class ActorListUpdate(generics.RetrieveUpdateDestroyAPIView):
    queryset = Actor.objects.all()
    serializer_class = IpActorSerializer


class DirectorList(generics.ListCreateAPIView):
    serializer_class = DirectorMoviesSerializer

    def get_queryset(self):
        queryset = Director.objects.all().annotate(visits_count=Count('visit')).order_by('-visits_count')
        search = self.request.query_params.get('search', None)
        if search is not None:
            queryset = queryset.filter(search_field__icontains=search)
        return queryset


class DirectorDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Director.objects.all()
    serializer_class = DirectorSerializer


class DirectorListUpdate(generics.RetrieveUpdateDestroyAPIView):
    queryset = Director.objects.all()
    serializer_class = IpDirectorSerializer


class MoodList(generics.ListCreateAPIView):
    queryset = Mood.objects.all()
    serializer_class = MoodMoviesSerializer


class MoodDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Mood.objects.all()
    serializer_class = MoodMoviesSerializer


class MovieDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Movie.objects.all()
    serializer_class = MoviesReviewsSerializer


class ReviewListDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Review.objects.all()
    serializer_class = ReviewListLikeSerializer


class ReviewList(generics.ListCreateAPIView):
    serializer_class = ReviewSerializer

    def get_queryset(self):
        queryset = Review.objects.all()
        user = self.request.query_params.get('user', None)
        if user is not None:
            queryset = queryset.filter(user=user)
        return queryset


class ReviewLikeModify(generics.RetrieveUpdateDestroyAPIView):
    queryset = ReviewLikeModel.objects.all()
    serializer_class = ReviewLikeSerializer


class ReviewLike(generics.ListCreateAPIView):
    serializer_class = ReviewLikeSerializer

    def get_queryset(self):
        queryset = ReviewLikeModel.objects.all()
        user = self.request.query_params.get('user', None)
        review = self.request.query_params.get('review', None)
        if user is not None and review is not None:
            queryset = queryset.filter(user=user)
            queryset = queryset.filter(review=review)
        return queryset


class UserMovieListDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = UserMovieListModel.objects.all()
    serializer_class = UserMovieListSerializer


class UserMovieList(generics.ListCreateAPIView):
    serializer_class = UserMovieListSerializer

    def get_queryset(self):
        queryset = UserMovieListModel.objects.all()
        title = self.request.query_params.get('title', None)
        user_id = self.request.query_params.get('user', None)
        if user_id is not None:
            queryset = queryset.filter(user=user_id)
        if title is not None:
            queryset = queryset.filter(title=title)
        return queryset


class User(generics.ListCreateAPIView):
    serializer_class = UserSerializer

    def get_queryset(self):
        if self.request.user.is_superuser:
            return CustomUser.objects.all()
        return CustomUser.objects.filter(username=self.request.user)


class UserModify(generics.RetrieveUpdateDestroyAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer


class UserModifyNoPw(generics.RetrieveUpdateDestroyAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserNoPwSerializer

    def put(self, request, *args, **kwargs):
        serializer = self.serializer_class(self.get_object(), data=request.data, partial=True)

        if serializer.is_valid():
            instance = serializer.save()
            # Generate a new token
            payload = jwt_payload_handler(instance)
            token = jwt.encode(payload, site_config.SECRET_KEY)
            response = JsonResponse({'token': token.decode('unicode_escape')})
            response.status = 200
            return response
        else:
            response = Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            return response


class Rating(generics.ListCreateAPIView):
    queryset = RatingMovie.objects.all()
    serializer_class = RatingMovieSerializer


class FeedbackList(generics.ListCreateAPIView):
    queryset = Feedback.objects.all()
    serializer_class = FeedbackSerializer


class FeedbackListDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Feedback.objects.all()
    serializer_class = FeedbackSerializer
