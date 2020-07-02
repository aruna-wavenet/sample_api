# Official Elixir release
FROM elixir:1.9.1

# Make sure we have sudo 
RUN apt-get update && \
      apt-get -y install sudo

# Create an app directory to store our files in
ADD . /app

# Install the Phoenix (phx) archive
RUN mix local.hex --force \
    && mix local.rebar --force
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force

# Install node (needed from brunch if you use it)
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && sudo apt-get install -y inotify-tools nodejs

# Set working directory as app
WORKDIR /app

# CD to assests folder and install node modules
#RUN cd assets && npm install

# Back to root folder
RUN cd ../

# Install Elxir dependencies
RUN mix deps.get

# Grant permissions to run.sh file
# RUN chmod +x ./run.sh

# Compile files
RUN mix compile

# Expose port 4000
EXPOSE 4000

# Execute commands mentioned under run.sh file
CMD ["./run.sh"]
