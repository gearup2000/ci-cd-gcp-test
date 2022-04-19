#---------------------------------------------------------------------------
# Dockefile / creates a Docker Image with integrated Apache WebServer. The OS is Ubuntu 21.04
# ---------------------------------------------------------------------------

# Define the image to use.
FROM ubuntu:21.04

# Update the ubuntu image.
RUN apt-get -y update

# Install Apache HTTP Server.
RUN apt-get -y install apache2

# Insert the "Docker Image on CloudRun" text to the index.html file.
RUN echo 'Docker Image on CloudRun<br>' > /var/www/html/index.html

# Add the "Version of App 0.1" to default index.html file and change the color of the text to the DeepSkyBlue.
RUN echo '<b><font color="DeepSkyBlue">Version of App 0.1</font></b>' >> /var/www/html/index.html

# Run Apache service in the foreground after the container is started.
CMD ["/usr/sbin/apache2ctl", "-D","FOREGROUND"]

# instruct the Docker container to listen on port 80
EXPOSE 80
