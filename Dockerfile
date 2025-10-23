#Grab the latest alpine image
FROM alpine:latest

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

COPY --from=postgrest/postgrest /bin/postgrest /bin

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku. The "sh", "-c" prefix enable $PORT to be accessed
CMD [ "sh", "-c", "PGRST_SERVER_PORT=$PORT /bin/postgrest" ]
