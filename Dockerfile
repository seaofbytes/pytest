FROM python:3.8-slim-buster

WORKDIR /app

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender-dev \
        git

# Clone the ImageAI repository and install its dependencies
RUN git clone https://github.com/OlafenwaMoses/ImageAI.git \
    && cd ImageAI \
    && pip install -r requirements.txt \
    && python setup.py install

# Copy your application code to the container
RUN apt-get install python3-tk -y
RUN apt-get install libgl1-mesa-glx -y
# Run the application
COPY . .

CMD ["python", "app.py"]