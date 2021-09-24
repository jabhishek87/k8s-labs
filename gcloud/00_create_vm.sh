#!/bin/sh

# Create cks-master
gcloud compute instances create cks-master --zone=asia-south1-c \
--machine-type=e2-medium \
--image=ubuntu-1804-bionic-v20201014 \
--image-project=ubuntu-os-cloud \
--boot-disk-size=50GB


# CREATE cks-worker VM using gcloud command
gcloud compute instances create cks-worker --zone=asia-south1-c \
--machine-type=e2-medium \
--image=ubuntu-1804-bionic-v20201014 \
--image-project=ubuntu-os-cloud \
--boot-disk-size=50GB

# OPEN PORTS for Nodeports
gcloud compute firewall-rules create nodeports --allow tcp:30000-40000


# install k8s master
gcloud compute ssh cks-worker --zone=asia-south1-c -- sudo bash -s < ../scripts/install_worker.sh &
P2=$!

# install k8s worker
gcloud compute ssh cks-master --zone=asia-south1-c -- sudo bash -s < ../scripts/install_master.sh &
P1=$!
wait $P2 $P1

gcloud compute ssh cks-master --zone=asia-south1-c -- "sudo chown -R $USER:$USER ~/.kube/"
