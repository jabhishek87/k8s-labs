#!/bin/sh

gcloud compute instances delete cks-master --zone=asia-south1-c -q
gcloud compute instances delete cks-worker --zone=asia-south1-c -q
gcloud compute firewall-rules delete nodeports -q
