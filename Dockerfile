# # Use an official Golang runtime as a parent image
# FROM golang:1.17.5

# # Set the working directory to /app
# WORKDIR /app   

# # Copy the current directory contents into the container at /app
# COPY cmd/cataloguesvc/app .
# RUN chmod -R 777 /app
# # Build the Go application
# #RUN go build -o catalogue
# #RUN chmod +x ./catalogue
# # Expose port 8080 to the outside world
# EXPOSE 8080

# # Define the command to run the Go application
# #CMD ["./app"]
# ENTRYPOINT ["/app/app"]

FROM golang:1.16-alpine

# Set the current working directory inside the container
WORKDIR /go/src/app

# Copy the go.mod and go.sum files to the container
COPY go.mod go.sum ./

# Download the Go module dependencies
RUN go mod download

# Copy the source code to the container
COPY . .

# Build the Go application
RUN cd cmd/cataloguesvc && go build -o app
EXPOSE 8080
# Set the command to run when the container starts
ENTRYPOINT ["/go/src/app/cmd/cataloguesvc/app"]