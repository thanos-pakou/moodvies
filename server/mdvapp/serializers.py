from django.db.models import Sum, Avg
from rest_framework import serializers
from rest_framework.exceptions import ValidationError
from rest_framework.validators import UniqueValidator
import re

from .models import Genre, Movie, Actor, Director, Mood, Review, RatingMovie, ReviewLike, UserMovieList, \
    UserMovieListComment, UserMovieListLike, IPAddress, Feedback
from django.contrib.auth.models import User


class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
        required=True,
        validators=[UniqueValidator(queryset=User.objects.all())]
    )
    username = serializers.CharField(
        min_length=6,
        validators=[UniqueValidator(queryset=User.objects.all())]
    )
    password = serializers.CharField(min_length=8)
    first_name = serializers.CharField(
        required=True,
        min_length=2
    )
    last_name = serializers.CharField(
        required=True,
        min_length=2
    )

    def validate_username(self, value):
        data = self.get_initial()
        if not (re.match("^[a-zA-Z0-9_]*$", value)):
            raise ValidationError("Ensure this field doesn't contain any special characters")
        return value


    def validate_first_name(self, value):
        data = self.get_initial()
        if not (re.match("^[a-zA-Z0-9_]*$", value)):
            raise ValidationError("Ensure this field doesn't contain any special characters")
        return value

    def validate_last_name(self, value):
        data = self.get_initial()
        if not (re.match("^[a-zA-Z0-9_]*$", value)):
            raise ValidationError("Ensure this field doesn't contain any special characters")
        return value

    def create(self, validated_data):
        username = validated_data['username']
        email = validated_data['email']
        password = validated_data['password']
        first_name = validated_data['first_name']
        last_name = validated_data['last_name']
        user = User(username=username, email=email, first_name=first_name, last_name=last_name)
        user.set_password(password)
        user.save()
        return validated_data

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'first_name', 'last_name')


class UserSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password')


class IpAddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = IPAddress
        fields = '__all__'


class SimpleMovieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Movie
        fields = '__all__'


class ActorSerializer(serializers.ModelSerializer):
    date_of_birth = serializers.DateField(format="%d-%m-%Y")
    visit_details = IpAddressSerializer(many=True, read_only=True, source='visit')
    movies = serializers.SerializerMethodField()
    visits_count = serializers.IntegerField(read_only=True)

    class Meta:
        model = Actor
        ordering = 'visits_count'
        fields = ('idActor', 'name', 'last_name', 'description', 'date_of_birth', 'visit', 'visit_details',
                  'visits_count', 'image', 'movies')

    def get_movies(self, obj):
        movies = Movie.objects.filter(actor=obj)
        serialized_movies = MovieSerializer(movies, many=True)
        return serialized_movies.data


class GenreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Genre
        fields = ('idGenre', 'genre', 'description',)


class MoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mood
        fields = ('id', 'mood', 'description')


class SimpleDirectorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Director
        fields = ('idDirector', 'name', 'l_name', 'date_of_birth', 'image', 'search_field')


class DirectorSerializer(serializers.ModelSerializer):
    visit_details = IpAddressSerializer(many=True, read_only=True, source='visit')
    movies = serializers.SerializerMethodField()
    visits_count = serializers.IntegerField(read_only=True)


    class Meta:
        model = Director
        fields = ('idDirector', 'name', 'l_name', 'date_of_birth', 'image', 'search_field', 'visit', 'visit_details',
                  'visits_count', 'movies')

    def get_movies(self, obj):
        movies = Movie.objects.filter(director=obj)
        serialized_movies = MovieSerializer(movies, many=True)
        return serialized_movies.data


class MoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mood
        fields = ('id', 'mood', 'description')


class MovieSerializer(serializers.ModelSerializer):
    total_rate = serializers.SerializerMethodField()
    ratings_count = serializers.SerializerMethodField()
    director_details = SimpleDirectorSerializer(many=True, read_only=True, source='director')
    genre_details = GenreSerializer(many=True, read_only=True, source='genre')
    mood_details = MoodSerializer(read_only=True, many=True, source='mood')
    strDuration = serializers.SerializerMethodField()

    def get_total_rate(self, obj):

        r_avg = RatingMovie.objects.filter(movie=obj).aggregate(Avg('rating'))
        if r_avg.get('rating__avg') is not None:
            total = float(r_avg.get('rating__avg'))
        else:
            total = 0
        return total

    def get_ratings_count(self, obj):
        r_count = RatingMovie.objects.filter(movie=obj).count()
        return r_count

    def get_strDuration(self, obj):
        duration = obj.duration
        hours = duration // 60
        mins = duration % 60
        toReturn = str(hours) + " Hours and " + str(mins) + " Minutes"
        return toReturn

    class Meta:
        model = Movie
        fields = ('id', 'user', 'title', 'description', 'pub_year', 'strDuration',
                  'country', 'trailer_url', 'logo', 'mood', 'mood_details', 'genre', 'genre_details', 'actor',
                   'director', 'director_details', 'total_rate', 'imdb_score', 'duration',
                  'search_field', 'ratings_count', 'recommended')
        ordering = ('total_rate',)


class GenreMoviesSerializer(serializers.ModelSerializer):
    movies = serializers.SerializerMethodField()

    class Meta:
        model = Genre
        fields = ('idGenre', 'genre', 'description', 'movies')

    def get_movies(self, obj):
        movies = Movie.objects.filter(genre=obj)
        serialized_movies = MovieSerializer(movies, many=True)
        return serialized_movies.data


class ActorMoviesSerializer(serializers.ModelSerializer):
    date_of_birth = serializers.DateField(format='%d-%m-%Y', input_formats='%d-%m-%Y')
    movies = serializers.SerializerMethodField()
    visit_details = IpAddressSerializer(many=True, read_only=True, source='visit')

    class Meta:
        model = Actor
        fields = ('idActor', 'name', 'last_name', 'description', 'date_of_birth', 'image', 'visit', 'visit_details',
                  'movies')

    def get_movies(self, obj):
        movies = Movie.objects.filter(actor=obj)
        serialized_movies = MovieSerializer(movies, many=True)
        return serialized_movies.data


class DirectorMoviesSerializer(serializers.ModelSerializer):
    visit_details = IpAddressSerializer(many=True, read_only=True, source='visit')
    movies = serializers.SerializerMethodField()
    visits_count = serializers.IntegerField(read_only=True)
    director_details = DirectorSerializer(many=True, read_only=True, source='director')
    genre_details = GenreSerializer(many=True, read_only=True, source='genre')

    class Meta:
        model = Director
        fields = ('idDirector', 'name', 'l_name', 'date_of_birth', 'image', 'search_field', 'visit', 'visit_details',
                  'visits_count',  'movies', 'director_details', 'genre_details')

    def get_movies(self, obj):
        movies = Movie.objects.filter(director=obj)
        serialized_movies = MovieSerializer(movies, many=True)
        return serialized_movies.data


class ReviewSerializer(serializers.ModelSerializer):
    title = serializers.CharField(
        required=True,
        min_length=8,
        max_length=45
    )
    content = serializers.CharField(
        required=True,
        min_length=50
    )
    likes = serializers.SerializerMethodField()
    user_details = UserSerializer(read_only=True, source='user')
    users_liked = serializers.SerializerMethodField()

    def get_users_liked(self, obj):
        likes = ReviewLike.objects.filter(review=obj.idReview)
        serialized_users = ReviewLikeSerializer(likes, many=True)
        return serialized_users.data

    def get_likes(self, obj):
        likesCount = {"total_likes": ReviewLike.objects.filter(review=obj).count()}
        likesPositive = {"positive_likes": ReviewLike.objects.filter(review=obj, like=True).count()}
        serialized_likes = [likesPositive, likesCount]
        return serialized_likes

    def validate_title(self, value):
        return value

    def validate_content(self, value):
        return value

    class Meta:
        model = Review
        fields = ('idReview', 'user', 'user_details', 'movie', 'title', 'content', 'likes', 'users_liked', 'created')


class ReviewListLikeSerializer(serializers.ModelSerializer):
    likes = serializers.SerializerMethodField()

    def get_likes(self, obj):
        likes = ReviewLike.objects.filter(review=obj.idReview)
        serialized_likes = ReviewLikeSerializer(likes, many=True)
        return serialized_likes.data

    class Meta:
        model = Review
        fields = '__all__'


class ReviewLikeSerializer(serializers.ModelSerializer):
    user_details = UserSerializer(read_only=True, source='user')

    class Meta:
        model = ReviewLike
        fields = '__all__'


class RatingMovieSerializer(serializers.ModelSerializer):
    class Meta:
        model = RatingMovie
        fields = ('user', 'movie', 'rating')


class MoviesReviewsSerializer(serializers.ModelSerializer):
    strDuration = serializers.SerializerMethodField()
    ratings = serializers.SerializerMethodField()
    reviews = serializers.SerializerMethodField()
    director_details = DirectorSerializer(many=True, read_only=True, source='director')
    genre_details = GenreSerializer(many=True, read_only=True, source='genre')
    actor_details = ActorSerializer(many=True, read_only=True, source='actor')
    user_details = UserSerializer(read_only=True, source='user')
    mood_details = MoodSerializer(read_only=True, many=True, source='mood')

    def get_reviews(self, obj):
        reviews = Review.objects.filter(movie=obj)
        serialized_reviews = ReviewSerializer(reviews, many=True)
        return serialized_reviews.data

    def get_ratings(self, obj):
        ratingsSum = RatingMovie.objects.filter(movie=obj).aggregate(Sum('rating'))
        ratingsCount = RatingMovie.objects.filter(movie=obj).count()
        if (ratingsCount is not 0):
            total = int(ratingsSum['rating__sum']) / ratingsCount
        else:
            total = 0

        ratings = [total, ratingsCount]
        return ratings

    def get_strDuration(self, obj):
        duration = obj.duration
        hours = duration // 60
        mins = duration % 60
        toReturn = str(hours) + " Hours and " + str(mins) + " Minutes"
        return toReturn

    class Meta:
        model = Movie
        fields = ('id', 'user', 'user_details', 'title', 'description', 'pub_year', 'duration', 'strDuration',
                  'country', 'trailer_url', 'logo', 'mood', 'mood_details', 'genre', 'genre_details', 'actor',
                  'actor_details', 'director', 'director_details', 'reviews', 'ratings', 'imdb_score', 'recommended')


class UserMovieListLikeSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserMovieListLike
        fields = ('idUserMovieListLike', 'user', 'userMovieList', 'like')


class UserMovieListCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserMovieListComment
        fields = ('user', 'userMovieList', 'comment')


class UserMovieListSerializer(serializers.ModelSerializer):
    title = serializers.CharField(
        required=True,
        min_length=6,
        max_length=40,
        validators=[UniqueValidator(queryset=UserMovieList.objects.all())]
    )
    description = serializers.CharField(
        required=True,
        min_length=50,
    )
    user_details = UserSerializer(read_only=True, source='user')
    movies_details = MovieSerializer(read_only=True, many=True, source='movies')
    likes = serializers.SerializerMethodField()
    comments = serializers.SerializerMethodField()

    def validate_title(self, value):
        return value

    def validate_description(self, value):
        return value

    def get_likes(self, obj):
        likesCount = {"total_likes": UserMovieListLike.objects.filter(userMovieList=obj).count()}
        likesPositive = {"positive_likes": UserMovieListLike.objects.filter(userMovieList=obj, like=True).count()}
        toReturn = [likesCount, likesPositive]
        return toReturn

    def get_comments(self, obj):
        comments = UserMovieListComment.objects.filter(userMovieList=obj)
        serialized_comments = UserMovieListCommentSerializer(comments, many=True)
        return serialized_comments.data

    class Meta:
        model = UserMovieList
        fields = ('idUserMovieList', 'user', 'user_details', 'title', 'description', 'movies', 'movies_details',
                  'likes', 'comments', 'created')


class MoodMoviesSerializer(serializers.ModelSerializer):
    movies = serializers.SerializerMethodField()

    def get_movies(self, obj):
        movies = Movie.objects.filter(mood=obj)
        serialized_movies = MovieSerializer(movies, many=True)
        return serialized_movies.data

    class Meta:
        model = Mood
        fields = '__all__'


class FeedbackSerializer(serializers.ModelSerializer):

    class Meta:
        model = Feedback
        fields = '__all__'
