FROM ruby:3-slim

# Install system dependencies
RUN apt update && apt install -y \
   postgresql-client \
   pdftk \
   imagemagick \
   nodejs \
   curl \
   build-essential \
   libpq-dev \
   libyaml-dev \        
   git \
&& curl -L https://www.npmjs.com/install.sh | sh \
&& rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

# Install Ruby dependencies
RUN gem update --system

# Set working directory
WORKDIR /app

# Copy the rest of the application files
COPY . .

RUN bundle install --no-cache

# Expose port
EXPOSE 3000

# Start Rails server in development mode
CMD ["rails", "server", "-b", "0.0.0.0"]
