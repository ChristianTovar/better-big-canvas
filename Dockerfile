FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app
COPY . .
RUN rm -rf _build deps assets/node_modules
RUN cd assets && npm install && cd ../ && mix do deps.get, compile, phx.digest
USER root
EXPOSE 4000

CMD ["mix", "phx.server"]
