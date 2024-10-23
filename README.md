# cloud-lab
Automation and Exploration For Providing a Cloud Lab for 3rd Party Devs and Training Attendees

## Todo
- images / training: fix docker in docker and valiadate that crossplane render works.
- determine how attendees will connect to the lab machine pods.
- configuration package: to create secure k8s cluster and claim for arbitrary training lab machines.

## Initial Flow
- Create claim that includes attendee list, possibly with email and egress IP.
- Apply claim to get training lab machine pods on existing or new secure cluster.
- Build config package with apis
- Write build / push script
- Create a custom IAM role in the AWS target account where lab machines will
  reside, and update examples/providerconfig-aws.yaml to reference it.

## Network

After claiming the network a trace should show the following.

```
crossplane beta trace xnetwork.aws.platform.upbound.io/upbox-aws-network
NAME                                                   SYNCED   READY   STATUS
XNetwork/upbox-aws-network                             True     True    Available
├─ InternetGateway/upbox-aws-network-x5x69             True     True    Available
├─ MainRouteTableAssociation/upbox-aws-network-g9mb4   True     True    Available
├─ RouteTableAssociation/upbox-aws-network-8tdbn       True     True    Available
├─ RouteTable/upbox-aws-network-zh2dq                  True     True    Available
├─ Route/upbox-aws-network-p42fv                       True     True    Available
├─ SecurityGroupRule/upbox-aws-network-nzbsd           True     True    Available
├─ SecurityGroup/upbox-aws-network-ps2j6               True     True    Available
├─ Subnet/upbox-aws-network-g792x                      True     True    Available
└─ VPC/upbox-aws-network-ccjxj                         True     True    Available
```
