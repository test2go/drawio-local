FROM joshuarli/alpine-python3-pip:latest
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app

RUN pip3 install flask
ADD . /app/

EXPOSE 5000
CMD python3 app.py