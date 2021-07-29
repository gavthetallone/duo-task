# Use Python 3.6 or later as a base image
FROM python:3.9.6
# Copy contents into image
WORKDIR /app_duo
# Install pip dependencies from requirements
COPY . .

RUN pip3 install -r requirements.txt
# Set YOUR_NAME environment variable
#RUN export YOUR_NAME="Gavin"
# Expose the correct port
EXPOSE 5500
# Create an entrypoint
ENTRYPOINT ["python3", "app.py"]

