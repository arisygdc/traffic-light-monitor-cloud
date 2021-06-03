# Traffic Light Monitoring Deploymen

Script and configuration for Monitor the Traffic Light is part of capstone project B21-CAP0442 Team.

## Project Repository

- Android : https://github.com/erikrios/traffic-light-monitor
- Backend API: https://github.com/habibulilalbaab/traffic-light-monitor
- Machine Learning : N/A

## Deployment


### Deploy on your local machine

```
# Clone backend api repository
git clone https://github.com/habibulilalbaab/traffic-light-monitor.git

# Copy Dockerfile and vhost.conf
cp ~/<traffic-light-monitor-cloud directory>/Dockerfile ~/<traffic-light-monitor directory>/
cp ~/<traffic-light-monitor-cloud directory>/Dockerfile ~/<traffic-light-monitor directory>/

# Build
docker build -t tlm-api:v1 .

# Run
docker run --name tlm-api -p 80:80 tlm-api:v1
```

### Deploy on Google Cloud Platform
```
# Go to Cloud Shell

# Clone backend api repository and this repository
git clone https://github.com/arisygdc/traffic-light-monitor-cloud.git
git clone https://github.com/habibulilalbaab/traffic-light-monitor.git

# Copy Dockerfile and vhost.conf
cp ~/<traffic-light-monitor-cloud directory>/Dockerfile ~/<traffic-light-monitor directory>/
cp ~/<traffic-light-monitor-cloud directory>/Dockerfile ~/<traffic-light-monitor directory>/

# Build
gcloud builds submit -t gcr.io/${GOOGLE_CLOUD_PROJECT}/tlm-api:v1 .

# Create VM/Instance Template using this image
gcr.io/${GOOGLE_CLOUD_PROJECT}/tlm-api:v1 .
```
