# SSH Server for Kubernetes
Use SSH to connect to your kubernetes cluster.

## Usage

1. `kubectl apply -f manifests`
1. `POD=$(kubectl get pod -l app=ssh -o jsonpath="{.items[0].metadata.name}")`
1. `kubectl exec -ti $POD -- bash`
1. `adduser foobar`

After that you can access from another container using:
`ssh foobar@ubuntu-ssh`

