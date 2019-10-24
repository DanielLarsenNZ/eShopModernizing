$location = 'westus2'
$loc = 'wus2'
$rg = 'eshopmodernizing-rg'
$tags = 'project=scaling-the-monolith'
$namespace = "eshopmodernizing-$loc"
$queue = "eshopmodernizing-orders-$loc"
$servicebusAuthRule = 'SenderReceiver1'

# DEPLOY

# Create Resource Group
az group create -n $rg --location $location --tags $tags

# SERVICE BUS
# https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-geo-dr#setup
# https://docs.microsoft.com/en-us/cli/azure/servicebus/namespace?view=azure-cli-latest#az-servicebus-namespace-create

# Primary
az servicebus namespace create -g $rg -n $namespace --location $location --tags $tags --sku Basic
az servicebus queue create -g $rg --namespace-name $namespace --name $queue --default-message-time-to-live 'P14D'

az servicebus namespace authorization-rule create -g $rg --namespace-name $namespace --name $servicebusAuthRule --rights Listen Send

# Get connection string
$servicebusConnectionString = ( az servicebus namespace authorization-rule keys list -g $rg --namespace-name $namespace --name $servicebusAuthRule | ConvertFrom-Json ).primaryConnectionString
$servicebusConnectionString