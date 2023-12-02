#user-1
resource "aws_iam_user" "Peter-Griffin" {
  name = "Peter-Griffin"
}

#user-2
resource "aws_iam_user" "Thanos" {
  name = "Thanos"
}

#user-3
resource "aws_iam_user" "JURKINS" {
  name = "JURKINS"
}


#user-1 access key ID and secret key 
resource "aws_iam_access_key" "Peter-Griffin_access_key" {
  user = aws_iam_user.Peter-Griffin.name
}

output "access_key_id" {
  value = aws_iam_access_key.Peter-Griffin_access_key.id
  sensitive = true
}

output "secret_access_key" {
  value = aws_iam_access_key.Peter-Griffin_access_key.secret
  sensitive = true
}

locals {
  Peter-Griffin_keys_csv = "access_key,secret_key\n${aws_iam_access_key.Peter-Griffin_access_key.id},${aws_iam_access_key.Peter-Griffin_access_key.secret}"
}

resource "local_file" "Peter-Griffin_keys" {
  content  = local.Peter-Griffin_keys_csv
  filename = "achintha-keys.csv"
}

#user-2 create access key ID and secret key 
resource "aws_iam_access_key" "Thanos_access_key" {
  user = aws_iam_user.Thanos.name
}

output "access_key_id-2" {
  value = aws_iam_access_key.Thanos_access_key.id
  sensitive = true
}

output "secret_access_key-2" {
  value = aws_iam_access_key.Thanos_access_key.secret
  sensitive = true
}

locals {
  Thanos_keys_csv = "access_key,secret_key\n${aws_iam_access_key.Thanos_access_key.id},${aws_iam_access_key.Thanos_access_key.secret}"
}

resource "local_file" "Thanos_keys" {
  content  = local.Thanos_keys_csv
  filename = "achintha-keys.csv"
}

#user-3 create access key ID and secret key 
resource "aws_iam_access_key" "JURKINS_access_key" {
  user = aws_iam_user.JURKINS.name
}

output "access_key_id-3" {
  value = aws_iam_access_key.JURKINS_access_key.id
  sensitive = true
}

output "secret_access_key-3" {
  value = aws_iam_access_key.JURKINS_access_key.secret
  sensitive = true
}

locals {
  JURKINS_keys_csv = "access_key,secret_key\n${aws_iam_access_key.JURKINS_access_key.id},${aws_iam_access_key.JURKINS_access_key.secret}"
}

resource "local_file" "JURKINS_keys" {
  content  = local.JURKINS_keys_csv
  filename = "achintha-keys.csv"
}

#user-groups-1
resource "aws_iam_group" "terraform-developers" {
  name = "terraform-developers"
}

resource "aws_iam_group_membership" "Peter-Griffen_membership" {
  name = aws_iam_user.Peter-Griffin.name
  users = [aws_iam_user.Peter-Griffin.name]
  group = aws_iam_group.terraform-developers.name
}
resource "aws_iam_group_membership" "Thanos_membership" {
  name = aws_iam_user.Thanos.name
  users = [aws_iam_user.Thanos.name]
  group = aws_iam_group.terraform-developers.name
}
resource "aws_iam_group_membership" "JURKINS_membership" {
  name = aws_iam_user.JURKINS.name
  users = [aws_iam_user.JURKINS.name]
  group = aws_iam_group.terraform-developers.name
}
