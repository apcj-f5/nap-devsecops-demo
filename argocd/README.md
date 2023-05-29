
## Sealed Secrets

1. Install using Helm
    ```
    helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
    helm install sealed-secrets -n kube-system --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets
    ```
1. (Optional) Restore encryption keys
    ```
    kubectl apply -f main.key
    kubectl delete pod -n kube-system -l name=sealed-secrets-controller
    ```
1. (Optional) Make a backup of existing encryption key
    ```
    kubectl get secret -n kube-system -l sealedsecrets.bitnami.com/sealed-secrets-key -o yaml >main.key
    ```

## ArgoCD

```
kubectl apply -k argocd/install
kubectl apply -f argocd/app-of-apps.yaml
```

Web UI password
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```