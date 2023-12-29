docker build -t ynno/python-app:latest  .
docker push ynno/python-app:latest
kubectl apply -f deployment.yaml