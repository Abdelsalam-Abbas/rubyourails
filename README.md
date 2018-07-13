# The Meaning of Life

The Meaning of Life is an app developed using Ruby on Rails, PostgreSQL, Redis and Sidekiq.
 
------------------------------------------
## Requirements:-
- docker 
- docker-compose
- minikube ( or a kubernetes cluster )
- kubectl
------------------------------------------
## Installation on docker:-

### 1. Deploy docker-compose stack:
```
cd drkiq-docker
docker-compose up -d
```
### 2. Test the Installation:
Head over to  http://localhost:8000 and if you can see "the meaning of life" then the installation was successful.

------------------------------------------
## Installation on k8s :-

## Note:
Image being used for drkiq and sidekiq deployments are located at theabbas/drkiq:v8.
This image has been built using same files and can be replaced with the image being pushed to your own repo

```
YOUR_DOCKER_HUB_REPO=theabbas
docker build -t "${YOUR_DOCKER_HUB_REPO}"/drkiq:v8 . 
docker push "${YOUR_DOCKER_HUB_REPO}"
```

### 1. Deploy kubernetes manifests :
```
kubectl create -f drkiq-k8s/kube
```

### 2. test the Installation
```
kubectl port-forward $( kubectl get pods -l app=drkiq -o=jsonpath='{.items[0].metadata.name}') 8000:8000
```
Head over to  http://localhost:8000 and if you can see "the meaning of life" then the installation was successful.

------------------------------------------
## Destroy Everything

```
docker-compose down -v 
kubectl delete -f drkiq-k8s/kube
```
