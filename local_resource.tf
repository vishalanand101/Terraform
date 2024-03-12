resource "tls_private_key" "genpvtkey" {
  algorithm = "RSA"
  rsa_bits  = "4096"

}