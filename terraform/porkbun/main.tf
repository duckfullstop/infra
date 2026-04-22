// The porkbun module handles domains held at porkbun.com - right now that's just handling the nameservers.

provider "porkbun" {
    api_key = var.key
    secret_key = var.secret
}
