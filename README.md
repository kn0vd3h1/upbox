# cloud-lab
Automation and Exploration For Providing a Cloud Lab for 3rd Party Devs and Training Attendees

## Todo
- Create claims for first attendee group

## Initial Flow
- `make install-configurations`
- `make claim-network`
- Add claims to `examples\companies` for upboxes as needed.
- `make claim-upboxes`
- Get connection info with `make access-info`

## Network

After claiming the network a trace should show the following.

```
crossplane beta trace xnetwork.aws.platform.upbound.io/upbox-aws-network
NAME                                                   SYNCED   READY   STATUS
XNetwork/upbox-aws-network                             True     True    Available
├─ InternetGateway/upbox-aws-network-4p2vp             True     True    Available
├─ MainRouteTableAssociation/upbox-aws-network-nzfsc   True     True    Available
├─ RouteTableAssociation/upbox-aws-network-bdtrr       True     True    Available
├─ RouteTable/upbox-aws-network-k98zs                  True     True    Available
├─ Route/upbox-aws-network-9w9cm                       True     True    Available
├─ SecurityGroupRule/upbox-aws-network-2825b           True     True    Available
├─ SecurityGroupRule/upbox-aws-network-2sgz5           True     True    Available
├─ SecurityGroupRule/upbox-aws-network-d4b27           True     True    Available
├─ SecurityGroupRule/upbox-aws-network-nwb2k           True     True    Available
├─ SecurityGroup/upbox-aws-network-g95d2               True     True    Available
├─ Subnet/upbox-aws-network-lv5zt                      True     True    Available
└─ VPC/upbox-aws-network-zjdlc                         True     True    Available
```

## Upbox

```
crossplane beta trace xupbox.aws.platform.upbound.io/upbox-upbound-markus-schweig
NAME                                             SYNCED   READY   STATUS
XUpbox/upbox-upbound-markus-schweig              -        -
├─ Instance/upbox-upbound-markus-schweig-r8tfg   True     True    Available
└─ KeyPair/upbox-upbound-markus-schweig          True     True    Available
```

Find the upbox AWS endpoint in the MR instance yaml.
Connect to your upbox using ssh as follows:

```
ssh -v ec2-user@ec2-54-224-10-88.compute-1.amazonaws.com
```

### Access Info

```
make access-info
upbox-upbound-mark-d5z4t: ssh ec2-user@ec2-54-152-160-63.compute-1.amazonaws.com
upbox-upbound-markus-schweig-2-vqkdl: ssh ec2-user@ec2-3-84-88-251.compute-1.amazonaws.com
upbox-upbound-markus-schweig-dxpg4: ssh ec2-user@ec2-54-81-90-57.compute-1.amazonaws.com
```
