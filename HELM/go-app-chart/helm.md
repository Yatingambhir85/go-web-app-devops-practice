To create HELM chart where user can simply install all the manifest of K8s in one go:

Step 1: Run the below command to create a helm chart

helm create <chart-name>

Step 2: Navigate to the chart directory and delete the charts folder

cd <chart-name>

rm -rf charts

Step 3: Navigate to the templates file and remove the existing files created by default

cd templates

rm -rf *

Step 4: Copy all the K8s manifest files into your Helm Templates folder

cp k8s-maifests/* <chart-name>/templates


