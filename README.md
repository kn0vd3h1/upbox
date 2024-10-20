# cloud-lab
Automation and Exploration For Providing a Cloud Lab for 3rd Party Devs and Training Attendees

## Todo
- images / training: fix docker in docker and valiadate that crossplane render works.
- determine how attendees will connect to the lab machine pods.
- configuration package: to create secure k8s cluster and claim for arbitrary training lab machines.

## Initial Flow
- Create claim that includes attendee list, possibly with email and egress IP.
- Apply claim to get training lab machine pods on existing or new secure cluster.
