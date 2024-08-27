from django.db import models
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _

class CustomUserManager(BaseUserManager):
    """
    Defines how the User(or the model to which attached)
    will create users and superusers.
    """
    def create_user(self, email, password, **extra_fields):
        """
        Create and save a user with the given email and password
        """
        if not email:
            raise ValueError(_("The Email must be set"))
        email = self.normalize_email(email) # lowercase the domain
        user = self.model(email=email, **extra_fields)
        user.set_password(password) # hash raw password and set
        user.save()
        return user

    def create_superuser(self, email, password, **extra_fields):
        """
        Create and save a superuser with the given email and password Extra fields are added to indicate that the user is staff, active, and indeed a superuser.
        """
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("is_active", True)
        if extra_fields.get("is_staff") is not True:
            raise ValueError(
                _("Superuser must have is_staff=True.")
            )
        if extra_fields.get("is_superuser") is not True:
            raise ValueError(
                _("Superuser must have is_superuser=True.")
            )
        return self.create_user(email, password, **extra_fields)


class CustomUser(AbstractUser):
    username = None
    email = models.EmailField(_('email address'), unique=True)
    # Add many fields as you need
    # date_of_birth = models.DateField(verbose_name="Birthday",null=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = [
        # Add extra fields you need, the USERNAME_FIELD aka 'email' and 'password' cannot be included here
        # "first_name",
        # "last_name",
        # "date_of_birth", # for example
    ]
    objects = CustomUserManager()

    def __str__(self):
        return self.email