# deployment

## Setup
When the cluster is created for the first time, we need to:
 
- Create secrets

```
mv secrets.sh.sample secrets.sh
sh secrets.sh
```

- Create the database and seeds after running pods

```
kubectl exec -it masajid-frontend-pod rails db:create db:migrate db:seed
kubectl exec -it masajid-frontend-pod rails content_places:import only=countries 
```

## Apply

We deploy using Kustomize.

To deploy locally use:

```
kustomize build local | kubectl apply -f -
```

To deploy to prod  use:

```
kustomize build prod | kubectl apply -f -
```
