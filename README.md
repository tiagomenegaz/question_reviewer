# README

* Ruby version
Certifique-se que você está com Ruby 2.5.1 e Rails 5.2. Utilize [RVM](https://rvm.io/) para instalar as dependências necessárias.

* Configuration
Para criar usuários de acordo com o seed, basta executar:

```
$ rake db:seed
```

Isso irá gerar um usuário administrador com email `admin@example.com` e um normal com `user@example.com`.
Ambas as senhas serão `App123`.

* Database creation
Certifique-se que você possui Postgres 9.5 instalado e funcionando no seu computador.

Caso não possua o Postgres instalado, o seguinte trecho mostra como você poderá baixá-lo no seu Ubuntu 16.04

```
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql-9.5 libpq-dev
```
Fonte [GoRails](https://gorails.com/setup/ubuntu/16.04)

Caso não seja o seu caso, utilize a [documentação oficial](https://www.postgresql.org/download/) de acordo com a sua necessidade.
