function az_web --description 'Use az web'
  az aks browse --name aks-$argv --resource-group $argv
end

