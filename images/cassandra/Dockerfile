ARG IMAGE_VERSION=3.11.2
FROM cassandra:${IMAGE_VERSION}

ENV HEAP_NEWSIZE: "32M"
ENV MAX_HEAP_SIZE: "1024M"

COPY files/ /

HEALTHCHECK --interval=30s --timeout=30s --start-period=20s --retries=5 \
  CMD [ "/bin/sh", "-c", "[ $(nodetool statusgossip) = running ]" ]
