resource "helm_release" "sa_chart" {
  name       = "service-accounts-release"
  repository = "./helm_charts"
  chart      = "sa_chart"
  namespace = "kube-system"

  set {
    name  = "serviceAccountsRoles.secretManagerArn"
    value = var.secret_manager_role
  }

  set {
    name  = "serviceAccountsRoles.ingressControllerArn"
    value = var.ingress_controller_role
  }
}

resource "helm_release" "secrets_store_csi_driver_chart" {
  name       = "csi-secrets-store"
  namespace = "kube-system"
  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart      = "secrets-store-csi-driver"

  set {
    name  = "syncSecret.enabled"
    value = true
  }
  

  depends_on = [
    helm_release.sa_chart
  ]
}

resource "helm_release" "ascp" {
  name       = "secrets-provider-aws"
  repository = "https://aws.github.io/secrets-store-csi-driver-provider-aws"
  chart      = "secrets-store-csi-driver-provider-aws"
  namespace = "kube-system"

  depends_on = [
    helm_release.secrets_store_csi_driver_chart
  ]
}

resource "helm_release" "alb_ingress_controller" {
  name       = "alb-ingress-controller"
  namespace = "kube-system"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.create"
    value = false
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  depends_on = [
    helm_release.ascp
  ]
}

resource "helm_release" "app" {
  name       = "app"

  repository = "./helm_charts"
  chart      = "app_chart"

  depends_on = [
    helm_release.alb_ingress_controller
  ]
}


resource "helm_release" "fluentbit" {
  name       = "fluentbit"

  repository = "./helm_charts"
  chart      = "fluentbit_chart"

  set {
    name  = "configMap.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "configMap.region"
    value = var.region
  }

  depends_on = [
    helm_release.app
  ]
}