FROM golang:1.21-alpine AS builder
WORKDIR /usr/src/myapp
COPY . .
RUN go build -o fullcyclerocks

FROM scratch
COPY --from=builder /usr/src/myapp/fullcyclerocks /fullcyclerocks
ENTRYPOINT ["/fullcyclerocks"]
