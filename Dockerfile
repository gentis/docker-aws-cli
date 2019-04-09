FROM docker:18.09.4
RUN apk update
RUN apk add python py-pip
RUN pip install --upgrade awscli==1.14.5
