FROM elyase/staticpython
RUN mkdir /dist
WORKDIR /dist

COPY src/. .

EXPOSE 8080

CMD [ "python", "server.py","8080" ]
