FROM jetty:9-jre11

USER root
RUN apt-get update && \
    apt-get -y -q --no-install-recommends install \
    ffmpeg \
    mediainfo \
    tesseract-ocr \
    tesseract-ocr-ara \
    tesseract-ocr-chi-sim \
    tesseract-ocr-chi-tra \
    tesseract-ocr-dan \
    tesseract-ocr-deu \
    tesseract-ocr-fin \
    tesseract-ocr-fra \
    tesseract-ocr-heb \
    tesseract-ocr-hin \
    tesseract-ocr-hun \
    tesseract-ocr-ita \
    tesseract-ocr-jpn \
    tesseract-ocr-kor \
    tesseract-ocr-lav \
    tesseract-ocr-nld \
    tesseract-ocr-nor \
    tesseract-ocr-pol \
    tesseract-ocr-por \
    tesseract-ocr-rus \
    tesseract-ocr-spa \
    tesseract-ocr-swe \
    tesseract-ocr-tha \
    tesseract-ocr-tur \
    tesseract-ocr-ukr \
    tesseract-ocr-vie && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER jetty

ADD docs.xml /var/lib/jetty/webapps/docs.xml
ADD docs-web/target/docs-web-*.war /var/lib/jetty/webapps/docs.war

ENV JAVA_OPTIONS -Xmx1g