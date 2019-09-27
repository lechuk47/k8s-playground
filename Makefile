
CLUSTER_NAME=standard-cluster-1
NODE_POOL=default-pool
ZONE=europe-west1-b
PROJECT=k8s-test-253407

## Two targets to save costs
# Add nodes to the cluster
scale-up:
	gcloud container clusters resize $(CLUSTER_NAME) \
			--node-pool $(NODE_POOL) \
			--num-nodes 3 \
			--zone $(ZONE) \
			--project $(PROJECT) \
			--quiet

# Remove nodes to the cluster
scale-down:
	gcloud container clusters resize $(CLUSTER_NAME) \
			--node-pool $(NODE_POOL) \
			--num-nodes 0 \
			--zone $(ZONE) \
			--project $(PROJECT) \
			--quiet


# Configure kubectl credentials
kubectl-config:
	gcloud container clusters get-credentials $(CLUSTER_NAME)

