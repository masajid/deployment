# deployment

We deploy using Kustomize.

To deploy locally use:

```
kustomize build local | kubectl apply -f -
```

To deploy to prod  use:

```
kustomize build prod | kubectl apply -f -
```
