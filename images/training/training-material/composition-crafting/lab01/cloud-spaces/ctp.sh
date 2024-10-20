cat <<EOF | kubectl apply -f -
apiVersion: spaces.upbound.io/v1beta1
kind: ControlPlane
metadata:
  name: train-${CUSTOMER}-ctp-${ID}
  namespace: train-${CUSTOMER}
spec:
  writeConnectionSecretToRef:
    name: train-${CUSTOMER}-ctp-${ID}
    namespace: train-${CUSTOMER}
EOF
