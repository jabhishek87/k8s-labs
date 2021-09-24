# Kubernetes two node cluster on google cloud

## Prerequisites
- [GCP Account](https://console.cloud.google.com/)
- [gcloud cli set up locally](https://cloud.google.com/sdk/docs/install)


### Steps to launch and setup cluster
- clone Repo `git@github.com:jabhishek87/k8s_tutz.git`
- change directory `cd k8s-labs/gcloud/`
- launch vms `./00_create_vm.sh`

To create cluster copy the last command in terminal which will start like
`kubeadm join ** ** **`

```sh
gcloud compute ssh cks-worker --zone=asia-south1-c  --command="sudo <paste-kebeadm-command>"
```

### Start using the cluster
`gcloud compute ssh cks-master --zone=asia-south1-c`
`kubectl get nodes`


> PS: Please stop / delete vm always

- to delete vms `./01_delete_vm.sh`

- to stop vms `./02_stop_vm.sh`
- to start vms `./03_start_vm.sh`


### Steps to install runsc on worker node

```sh
gcloud compute ssh cks-worker --zone=asia-south1-c -- sudo bash -s < ../scripts/install_gvisor.sh
```