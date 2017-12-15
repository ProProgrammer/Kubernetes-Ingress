gcloud container clusters create kubelive
gcloud container clusters get-credentials kubelive

# Create a deployment called nginx using nginx:latest image
kubectl run nginx --image=nginx --port=80
kubectl expose deployment nginx --target-port=80 --type=NodePort


kubectl apply -f nginx-ingress.yml
# Open <IP Address>

kubectl get ingress nginx-ingress
kubectl describe ingress nginx-ingress

glcoud compute addresses create nginx-static-ip --global
kubectl apply -f nginx-ingress-ip.yml
# open <IP Address>

kubectl run echoserver --image=gcr.io/google_containers/echoserver:1.4 --port=8080
kubectl expose deployment echoserver --target-port=8080 --type=NodePort

kubectl create -f fanout-ingress.yml
# open <IP Address> & <IP Address>/echo

# Switch cluster