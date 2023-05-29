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
kubectl apply -k argocd/bootstrap/install
kubectl apply -f argocd/bootstrap/app-of-apps.yaml
```

Web UI password

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

Access ArgoCD Web UI

1. Get default admin password
   ```
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
   ```
1. Port forward argocd-server HTTPS port
   ```
   kubectl -n argocd port-forward svc/argocd-server 8443:443
   ```
1. Access web UI on [https://localhost:8443](https://localhost:8443)
