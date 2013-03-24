openvpn::client {
  "node_${hostname}_dc1":
    server => "vpn.dc1.example.com",
    cert   => "node_${hostname}";
}
