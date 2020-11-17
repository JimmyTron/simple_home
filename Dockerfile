FROM elixir:1.11.2-alpine


ENV HOME=/opt/app
WORKDIR $HOME

RUN apk update
RUN apk add  bash curl nodejs npm inotify-tools postgresql-client



#install phoenix dependenices
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force hex phx_new 1.5.6


COPY . .

RUN mix deps.get

RUN cd $HOME/assets \
  && npm install \  
  && cd ..



EXPOSE 4000
RUN chmod +x ./entry.sh
ENTRYPOINT [ "./entry.sh" ]





