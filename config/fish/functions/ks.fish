function ks --description 'show cluster status for dev, int or prod'
  az aks show --resource-group $argv --name aks-$argv --output table
end
