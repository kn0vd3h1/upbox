TAG=v0.0.1

all: create-repos build-and-push-all-configurations
build-and-push-all-configurations: build-and-push-network-configuration build-and-push-upbox-configuration
build-and-push-network-configuration: build-network-configuration push-network-configuration
build-and-push-upbox-configuration: build-upbox-configuration push-upbox-configuration

create-repos: ## Create Repositories
	up repo create upbound-upbox-network -a upbound
	up repo create upbound-upbox -a upbound

build-network-configuration: ## Build Upbox Network Configuration Package
	up xpkg build --package-root=configuration-network-package -o configuration-network-package/upbound-upbox-network.xpkg

push-network-configuration: ## Push Upbox Network Configuration Package
	up xpkg push upbound/upbound-upbox-network:${TAG} --package=configuration-network-package/upbound-upbox-network.xpkg -a upbound

build-upbox-configuration: ## Build Upbox Configuration Package
	up xpkg build --package-root=configuration-upbox-package -o configuration-upbox-package/upbound-upbox.xpkg

push-upbox-configuration: ## Push Upbox Network Configuration Package
	up xpkg push upbound/upbound-upbox:${TAG} --package=configuration-upbox-package/upbound-upbox.xpkg -a upbound

install-configurations: ## Install Crossplane Configurations
	up ctx upbound/upbound-aws-us-east-1/upbox/upbox-ctp
	kubectl apply -f examples/configuration.yaml
	kubectl wait configuration.pkg configuration-upbox-network --for=condition=HEALTHY
	kubectl wait configuration.pkg configuration-upbox --for=condition=HEALTHY
	kubectl apply -f examples/providerconfig-aws.yaml

claim-network: ## Claim Upbox Network
	kubectl apply -f examples/network-xr.yaml
	crossplane beta trace xnetwork.aws.platform.upbound.io/upbox-aws-network
	kubectl wait xnetwork.aws.platform.upbound.io/upbox-aws-network --for=condition=READY
	crossplane beta trace xnetwork.aws.platform.upbound.io/upbox-aws-network

claim-upboxes: ## Claim Upboxes
	kubectl apply -f examples/companies/upbound/
	kubectl apply -f examples/companies/mmc/

clean: ## Remove Upbox Resources and Configurations
	kubectl delete -f examples/companies/mmc/
	kubectl delete -f examples/companies/upbound/
	kubectl delete -f examples/network.yaml
	kubectl delete -f configuration.pkg configuration-upbox
	kubectl delete -f configuration.pkg configuration-upbox-network

access-info: ## Show Upbox Access Info
	@kubectl get instance --no-headers |\
       		awk '{print $$1}' |\
		while read i; do \
			echo "$$i: ssh ec2-user@$$(kubectl get instance $$i \
			-o jsonpath='{.status.atProvider.publicDns}')"; \
		done
