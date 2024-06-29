function gocipher() {


# ssh cipher@192.168.227.96
ssh -i "$($env:cipher_key)" "cipher@$($env:cipher_ip)"

}
