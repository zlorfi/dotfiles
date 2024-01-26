function kc --description 'switch context to dev, int or prod'
  if test "$argv" = "dev"
    kubectl config use-context tm-dev-aks-02
  else if test "$argv" = "int"
    kubectl config use-context tm-int-aks-02
  else if test "$argv" = "prod"
    kubectl config use-context tm-prd-aks-02
  else
    kubectl config use-context aks-prod
  end
end
