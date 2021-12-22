#! /bin/bash
export NODE_PORT=30978
for i in {1..20}
do 
        curl $(minikube ip):$NODE_PORT
done 

