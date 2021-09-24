#!/bin/sh

gcloud compute instances stop cks-master --zone=asia-south1-c -q
gcloud compute instances stop cks-worker --zone=asia-south1-c -q
