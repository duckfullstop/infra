variable "key" {
    description = "API key to authenticate to porkbun with."
}

variable "secret" {
    description = "API SECRET key to authenticate to porkbun with."
    sensitive = true
}