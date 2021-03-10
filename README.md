# aws_network_server_training
Create and study network and server using terraform based on [Amazon Web Services 基礎からのネットワーク＆サーバー構築 改訂3版](https://www.amazon.co.jp/dp/B084QQ7TCF/)

# Why
- To understand network and server more

# Why I use terraform
- To build the environment easily only when you need it

# How to use
```sh
git clone git@github.com:yoshi65/aws_network_server_training.git
cd aws_network_server_training
terraform init
terraform plan
terraform apply
```

If you want until specified chapter, you can use tag (`<chapter>-<section>`).
```sh
git checkout 2-4
```

# Dependencies
- terraform version: 0.14.8
- aws provider: 3.20
