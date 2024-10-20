#/bin/bash
cat << EOF > providerconfig-aws.yaml
apiVersion: aws.upbound.io/v1beta1
kind: ProviderConfig
metadata:
  name: default
spec:
  credentials:
    source: Upbound
    upbound:
      webIdentity:
        roleARN: arn:aws:iam::${TARGET_AWS_ACCOUNT_ID}:role/train-${CUSTOMER}-crossplane-1
EOF
