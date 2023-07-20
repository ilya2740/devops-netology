
# Домашнее задание к занятию «Введение в Terraform»

Пытался отредактировать текст как указано здесь  https://gist.github.com/Jekins/2bf2d0638163f1294637
По другому не знаю как сделать.

Terraform  установлен.

$ terraform --version
Terraform v1.5.2
on linux_amd64
Принт скрин добавил отдельным файлом к ответу на задание.




# Задание 1

 2. Изучите файл .gitignore. В каком terraform файле согласно этому .gitignore допустимо сохранить личную, секретную информацию?

**personal.auto.tfvars**

 3. Выполните код проекта. Найдите в State-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.

**"result": "75oXigVQEGAGP1Tt"**

4. Раскомментируйте блок кода, примерно расположенный на строчках 29-42 файла main.tf. Выполните команду terraform validate. Объясните в чем заключаются намеренно допущенные ошибки? Исправьте их.

**Ошибка 1**

Неправильно (отсутствует лабел. добавил лабел "nginx" ) :

resource "docker_image"  {
  name         = "nginx:latest"
  keep_locally = true
}

Правильно:
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}


**Ошибка 2**

Неправильно (название лейбла должно начинаться с буквы или подчеркивания, "1nginx" начинается с цифры 1  ):

resource "docker_container" "1nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string_fake.resuld}"

Правильно:

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string_fake.resuld}"

  
**Ошибка 3**

Неправильно (строка resource "random_password" "random_string" не совпадает со строкой  name  = "example_${random_password.random_string_fake.resuld}" хотя можно изменить строку  ):

name  = "example_${random_password.random_string_fake.resuld}"  по аналогии с resource "random_password" "random_string" т.е сделать name  = "example_${random_password.random_string.resuld}" 

resource "random_password" "random_string" {
resource "random_password" "random_string_fake" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_container" "1nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string_fake.resuld}"

  
Правильно:

resource "random_password" "random_string_fake" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}


resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string_fake.resuld}"  
  
  
 **Ошибка 4** 
 
 Неправильно. Неверно указана последняя буква в строке   name  = "example_${random_password.random_string_fake.resuld}". Нужно указать букву t .
  
 Правильно. 
  resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string_fake.result}" 
  
 
5. Выполните код. В качестве ответа приложите вывод команды docker ps 

**CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES**
**488b2bf41d4d   a7be6198544f   "/docker-entrypoint.…"   13 minutes ago   Up 13 minutes   0.0.0.0:8000->80/tcp   example_9hC1T4SAmr5fOtxR**

6. Замените имя docker-контейнера в блоке кода на hello_world, выполните команду terraform apply -auto-approve. Объясните своими словами, в чем может быть опасность применения ключа -auto-approve ? 
В качестве ответа дополнительно приложите вывод команды docker ps

При применении комманды   terraform apply будут показаны те изменения которые планируются применить при создании инфрастуктуры. Перед применением изменений нужно будет подтвердить (approve) применение изменений набрав комманду "yes".

При применении комманды   terraform apply  ключом -auto-approve  не будет возможности ознакомится с теми изменениями которые планируется применить при создании инфраструктуры. Все изменения будут применены автоматически, не нужно будет подтверждать применение изменений (approve) и набирать комманду "yes".

**docker ps**
**CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES**
**543c1ad37c66   a7be6198544f   "/docker-entrypoint.…"   6 minutes ago   Up 6 minutes   0.0.0.0:8000->80/tcp   example_9hC1T4SAmr5fOtxR**


7. Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.

**Cодержимое файла terraform.tfstate:

**{
**  "version": 4,**
**  "terraform_version": "1.5.1",**
**  "serial": 1,**
**  "lineage": "588c7a1e-4160-ea7f-3598-ee075e54f992",**
**  "outputs": {},**
** "resources": [],**
**  "check_results": null**
**}**

8. Объясните, почему при этом не был удален docker образ nginx:latest ? Ответ подкрепите выдержкой из документации провайдера.

**Docker образ не был удален потому что установлен параметр keep_locally = true**

**resource "docker_image" "nginx" {**
**  name         = "nginx:latest"**
**  keep_locally = true**
**}**

**Выдержка из документации:**
**keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation.** 
**If this is false, it will delete the image from the docker local storage on destroy operation.**

