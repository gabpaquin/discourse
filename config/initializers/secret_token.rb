
# Definitely change this when you deploy to production. Ours is replaced by jenkins.
# This token is used to secure sessions, we don't mind shipping with one to ease test and debug,
#  however, the stock one should never be used in production, people will be able to crack
#  session cookies.
#
# Generate a new secret with "rake secret".  Copy the output of that command and paste it
# in your secret_token.rb as the value of Discourse::Application.config.secret_token:
#
Discourse::Application.config.secret_token = "fdd60954cb22508a00edf1572e74b88808cc3d8bac85946313ca4a1f4047af63895e0cec8a6ec77fdddaa7fbf06d411899bc1b001959208a936232dc910c4e62"

