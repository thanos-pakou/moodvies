from django.conf import settings
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.contrib import admin

from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token, verify_jwt_token

from mdvapp import views

urlpatterns = [
    url(r'^api/', include('mdvapp.urls')),
    url(r'^admin/', admin.site.urls),
    url(r'^api-auth/', include('rest_framework.urls')),
    url(r'^api-token-auth/', obtain_jwt_token),
    url(r'^api-token-refresh/', refresh_jwt_token),
    url(r'^api-token-verify/', verify_jwt_token),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

urlpatterns += url(r'^(?P<path>.*)$', views.index),
