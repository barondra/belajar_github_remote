FROM python:3.6-slim

# copy file from local to docker container
COPY requirements.txt /requirements.txt

# copy local dir to coker container
COPY ./app /app

# set current working directory to root
WORKDIR /

# install python dependencies
RUN pip install -r requirements.txt


# stop here if want to run terminal 
# (use bash at end of docker run command)
# run the app
#ENTRYPOINT ["python"]

#CMD ["app/main.py"]