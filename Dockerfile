FROM 3apag/pubsub-emulator

RUN apk update && apk add py3-pip

COPY ./start.sh ./start.sh
RUN chmod +x ./start.sh

COPY ./setenv.sh ./setenv.sh
RUN chmod +x ./setenv.sh

RUN apk add --no-cache --virtual .build-deps \
    linux-headers build-base g++ python3-dev 
RUN pip3 install --no-cache-dir google-cloud-pubsub 
RUN apk del .build-deps

ENTRYPOINT [ "./start.sh" ]