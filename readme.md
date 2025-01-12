Grafana stack on Kubernetes

## How to run on local? 
You'll need a K8s cluster and Kubectl access. Personally I use Minikube on local. 

1. Install and run Minikube
2. Install Kubectl and switch to `minikube` context. 
3. Apply all the files using `make apply`
4. Use `make forward` if you like Kubernetes to forward the ports of Grafana and Prometheus on your local machine. 
    - Then open 'http://localhost:3000' for Grafana and 'http://localhost:9090' for Prometheus.
5. 

### How to access the services from local browser?
There are two ways for this.
- Either use `minikube ip` to access the service ports. For this to work you need to run the service as is(With NodePort type)
- Or use port-forwarding the expose the service port on your local. This is only recommended for development environment and not for production.
