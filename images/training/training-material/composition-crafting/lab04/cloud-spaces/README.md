# Readme

## Lab04 Cloud Spaces

```
export TARGET_AWS_ACCOUNT_ID="obtain id from your instructor"
```

```
kubectl apply -f vpc-aws.yaml
```

```
kubectl get vpc.ec2.aws.upbound.io
```

```
kubectl describe vpc.ec2.aws.upbound.io training-vpc
```

```
kubectl get vpc
```

```
kubectl get vpc training-vpc -o jsonpath='{.status}'|jq
```

```
kubectl desscribe vpc training-vpc
```

```
kubectl delete vpc.ec2.aws.upbound.io training-vpc
```
