#!/bin/sh

gcloud compute instances start cks-master --zone=asia-south1-c -q
gcloud compute instances start cks-worker --zone=asia-south1-c -q
