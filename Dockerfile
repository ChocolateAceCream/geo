FROM ruby:3.0.6

# Set environment variables
ENV RAILS_ENV=production
ENV RACK_ENV=production

# Install necessary dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

WORKDIR /app
COPY backend /app
RUN ls -la /app/bin
EXPOSE 3000

CMD ["/bin/bash", "/app/bin/start_service.sh"]
# CMD ["/bin/bash"]