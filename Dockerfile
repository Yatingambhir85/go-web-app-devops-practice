#Multi stage Dockerfile to build the Go application and then run it
#Stage 1: Build the Go application
FROM golang:1.22.5 AS base

# Set the working directory inside the container
WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o main .

#Final stage with distroless image
FROM gcr.io/distroless/base AS final

COPY --from=base /app/main .

COPY --from=base /app/static ./static

EXPOSE 8080

CMD [ "./main" ]
