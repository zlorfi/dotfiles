function kc --description 'switch context to dev, int or prod'
  kubectl config use-context aks-$argv
end
