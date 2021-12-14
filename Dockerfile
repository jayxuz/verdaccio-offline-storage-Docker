FROM verdaccio/verdaccio:5.3.1
USER root
RUN npm -g i verdaccio-offline-storage && \
  ln -s /usr/local/lib/node_modules/verdaccio-offline-storage /verdaccio/plugins/verdaccio-offline-storage  && \
  chown -R 10001 /usr/local/lib/node_modules/verdaccio-offline-storage && \
  chown -R 10001 /verdaccio/plugins
USER verdaccio
WORKDIR /verdaccio
EXPOSE 4873
VOLUME ["/verdaccio"]