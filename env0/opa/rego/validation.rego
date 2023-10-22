package terraform.validation

import data.terraform.library as lib

default allow = false

violations[msg] {
  no_open_cidr_blocks[msg]
}

no_open_cidr_blocks[msg] {
  open_cidr := "0.0.0.0/0"
  cidr_blocks := lib.resources[r].values.ingress[x].cidr_blocks
  lib.resources[r].values.ingress[x].to_port = 22
  lib.list_contains_value(cidr_blocks, open_cidr)
  msg = sprintf("Ingress definitions cannot use 0.0.0.0/0 within Security Groups!. Resource in violation: %v",[r.address])
}

allow {
  count(violations) == 0
}
