from django.contrib.auth.models import User
from django.contrib.auth.validators import ASCIIUsernameValidator
from django.db import models
from django.conf import settings


# --------------------- IP Adress Model ---------------------
class IPAddress(models.Model):
    id = models.AutoField(db_column='idActor', primary_key=True)  # Field name made lowercase.
    ip = models.CharField(db_column='nameActor', max_length=45, unique=True)

    class Meta:
        db_table = 'ipAddress'

    def __str__(self):
        return "%s " % self.ip


# --------------------- Actor Model ---------------------
class Actor(models.Model):
    idActor = models.AutoField(db_column='idActor', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='nameActor', max_length=45, blank=True, null=True)
    last_name = models.CharField(db_column='last_nameActor', max_length=45, blank=True, null=True)
    date_of_birth = models.DateField(db_column='date_of_birthActor', blank=True, null=True)
    description = models.CharField(db_column='descriptionActor', max_length=1000, blank=True, null=True)
    image = models.ImageField(default='', blank=True, null=True)
    search_field = models.CharField(max_length=200, blank=True, null=True)
    visit = models.ManyToManyField(IPAddress)
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'actor'

    def __str__(self):
        return "%s %s (%s)" % (self.name, self.last_name, self.date_of_birth)


# --------------------- Director Model ---------------------
class Director(models.Model):
    idDirector = models.AutoField(db_column='idDirector', primary_key=True)  # Field name made lowercase.
    name = models.CharField(max_length=50, blank=True, null=True)
    l_name = models.CharField(max_length=50, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    description = models.CharField(max_length=1000, blank=True, null=True)
    image = models.ImageField(default='')
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'director'

    def __str__(self):
        return "%s %s      (%s)" % (self.name, self.l_name, self.date_of_birth)


# --------------------- Genre Model ---------------------
class Genre(models.Model):
    idGenre = models.AutoField(db_column='idGenre', primary_key=True)  # Field name made lowercase.
    genre = models.CharField(db_column='genre', max_length=50, blank=True, null=True, unique=True)
    description = models.CharField(db_column='descriptionGenre', max_length=1000, blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'genre'

    def __str__(self):
        return self.genre


# --------------------- Mood Model ---------------------
class Mood(models.Model):
    id = models.AutoField(db_column='idMood', primary_key=True)  # Field name made lowercase.
    mood = models.CharField(db_column='mood', max_length=45, blank=True, null=True)
    description = models.CharField(db_column='descriptionMood', max_length=400, blank=True, null=True)
    image = models.ImageField(default='')
    back_image = models.ImageField(default='')
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'mood'

    def __str__(self):
        return self.mood


class Images(models.Model):
    idimage = models.AutoField(primary_key=True)
    url = models.CharField(max_length=50)

    class Meta:
        db_table = 'images'


# --------------------- Movie Model ---------------------
class Movie(models.Model):
    id = models.AutoField(db_column='idMovie', primary_key=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(db_column='titleMovie', max_length=100)
    pub_year = models.IntegerField(db_column='pub_yearMovie')
    duration = models.IntegerField(db_column='durationMovie')
    description = models.CharField(db_column='descriptionMovie', max_length=2000)
    country = models.CharField(db_column='countryMovie', max_length=50)
    trailer_url = models.CharField(db_column='trailer_urlMovie', max_length=200, blank=True, null=True)
    logo = models.ImageField(default='')
    imdb_score = models.FloatField(db_column='imdb_scoreMovie', max_length=2.2, blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)
    mood = models.ManyToManyField(Mood, related_name='moods')
    search_field = models.CharField(max_length=1000, default=None)
    genre = models.ManyToManyField(Genre)
    actor = models.ManyToManyField(Actor)
    images = models.ManyToManyField(Images)
    director = models.ManyToManyField(Director)
    recommended = models.BooleanField(default=False)


    class Meta:
        db_table = 'movie'

    def __str__(self):
        return "%s(%s)" % (self.title, self.pub_year)


# --------------------- Review Model ---------------------
class Review(models.Model):
    idReview = models.AutoField(db_column='idReview', primary_key=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    title = models.CharField(db_column='titleReview', max_length=50)
    content = models.CharField(db_column='contentReview', max_length=4000)
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'review'

    def __str__(self):
        return "%s(%s)" % (self.movie, self.title)


# --------------------- Rating Movie Model ---------------------
class RatingMovie(models.Model):
    idRating = models.AutoField(db_column='idRating', primary_key=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    rating = models.IntegerField()
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'ratingMovie'
        unique_together = (('user', 'movie'),)

    def __str__(self):
        return "%s(%s)%s" % (self.user, self.movie, self.rating)


# --------------------- Rating Like Model ---------------------
class ReviewLike(models.Model):
    idReviewLike = models.AutoField(db_column='idReviewLike', primary_key=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    review = models.ForeignKey(Review, on_delete=models.CASCADE)
    like = models.BooleanField()
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'reviewLike'
        unique_together = (('user', 'review'),)

    def __str__(self):
        return "%s--%s--%s" % (self.review, self.user, self.like)


# --------------------- User Movie List Model ---------------------
class UserMovieList(models.Model):
    idUserMovieList = models.AutoField(db_column='idUserMovieList', primary_key=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=2000)
    movies = models.ManyToManyField(Movie)
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'userMovieList'

    def __str__(self):
        return "%s--%s" % (self.user, self.title)


# --------------------- User Movie List Like Model ---------------------
class UserMovieListLike(models.Model):
    idUserMovieListLike = models.AutoField(db_column='idUserMovieListLike', primary_key=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    userMovieList = models.ForeignKey(UserMovieList, on_delete=models.CASCADE)
    like = models.BooleanField()
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'userMovieListLike'
        unique_together = (('user', 'userMovieList'),)

    def __str__(self):
        return "%s--%s--%s" % (self.userMovieList, self.user, self.like)


# --------------------- User Movie List Comment Model ---------------------
class UserMovieListComment(models.Model):
    idUserMovieListComment = models.AutoField(db_column='idUserMovieListComment', primary_key=True)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    userMovieList = models.ForeignKey(UserMovieList, on_delete=models.CASCADE)
    comment = models.CharField(max_length=500)
    created = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        db_table = 'userMovieListComment'

    def __str__(self):
        return "%s--%s--%s" % (self.userMovieList, self.user.id, self.comment)


class CustomUser(User):
    username_validator = ASCIIUsernameValidator()

    class Meta:
        proxy = True


# --------------------- Feedback Model ---------------------
class Feedback(models.Model):
    idFeedback = models.AutoField(primary_key=True)
    email = models.EmailField(blank=True, null=True,)
    content = models.CharField(max_length=500)
    ip_address = models.ForeignKey(IPAddress, blank=True, null=True, on_delete=models.CASCADE)

    class Meta:
        db_table = 'feedback'

    def __str__(self):
        return "%s" % self.idFeedback

