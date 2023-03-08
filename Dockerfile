# Use an official Golang runtime as a parent image
FROM golang:1.17.5

# Set the working directory to /app
WORKDIR /catalogue    

# Copy the current directory contents into the container at /app
COPY cmd/cataloguesvc/catalogue /catalogue/

# Build the Go application
#RUN go build -o catalogue
#RUN chmod +x ./catalogue
# Expose port 8080 to the outside world
EXPOSE 8080

# Define the command to run the Go application
CMD ["./catalogue"]