# python base image
FROM python:3.12.3-slim

# set work environment
WORKDIR /webapp

# copy application code
COPY webapp /webapp

# install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# expose port that runs application
EXPOSE 3000

# run the application
CMD ["python", "app.py"]