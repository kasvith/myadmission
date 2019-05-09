# build stage
FROM golang:latest AS build-env
RUN mkdir -p /build
WORKDIR /build
COPY  . .
RUN go mod vendor
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-extldflags "-static"' -o mywebhook

FROM scratch
COPY --from=build-env /build/mywebhook .
ENTRYPOINT ["/mywebhook"]