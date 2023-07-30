

Задание 1

Вопрос 2


Вопрос 4

Ошибки допущенные в файле main.tf

platform_id = "standard-v4"

В YandexCloud отсутствует платформа "standard-v4" . Есть платформы "standard-v1" "standard-v2"  "standard-v3"

Платформа - это тип процессора который используется при создании виртуальной машины.
Подробнее https://cloud.yandex.ru/docs/compute/concepts/vm-platforms.



core_fraction = 5

core_fraction - ограничение времени в течении которого ВМ будет иметь доступ к физическим ядрам.
По сути это ограничение мощности ВМ. Данное ограничение влияет на стоимость ВМ. Такая ВМ дешевле чем ВМ с core_fraction = 100
https://cloud.yandex.ru/docs/compute/concepts/performance-levels
Для платформы standard-v3 , которую я выбрал, нельзя задать core_fraction = 5. Можно задать следующие значения:  20, 50, 100
Я выбрал core_fraction = 50



cores = 1

Количество ядер доступных для определенной платформы.
Для платформы standard-v3 , которую я выбрал, количество ядер может быть следующим: 2, 4
Я выбрал cores = 2


family = "ubuntu-2004-lts"

Семейства ubuntu-2004-lts нет.  Есть  ubuntu-2204-lts.


Вопрос 5

preemptible = true

Preemptible - вытесняемый.

Preemptible VM  -  виртуальная машина которая может быть остановлена в любое время.
Основные причины для остановки:
1. ВМ работает более 24 часов.
2. Недостаточно ресурсов для запуска регулярной ВМ (regular VM ) которая находится в той же зоне доступности. 

Ограничение для Preemptible VM:
1. Отсутствие ресурсов не позволит запустить Preemptible VM.
2. Preemptible VM не могут быть указаны в SLA.

Preemptible VM  дешевле чем Regular VM

Вся информация: https://cloud.yandex.com/en/docs/compute/concepts/preemptible-vm


core_fraction=5

core_fraction - ограничение времени в течении которого ВМ будет иметь доступ к физическим ядрам.
По сути это ограничение мощности ВМ. Данное ограничение влияет на стоимость ВМ. Такая ВМ дешевле чем ВМ с core_fraction = 100
https://cloud.yandex.ru/docs/compute/concepts/performance-levels


Задание 4

Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
Примените изменения.
В качестве решения приложите вывод значений ip-адресов команды terraform output

terraform output
```
vm_external_ip_address = {
  "yandex_compute_instance.platform_db" = "51.250.10.134"
  "yandex_compute_instance.platform_web" = "158.160.109.178"
}
```

Задание 5

В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
Замените переменные с именами ВМ из файла variables.tf на созданные вами local переменные.
Примените изменения.

Содержимое файла locals.tf

```
locals {

 name_web = "${ var.vm_web_name }-${ var.vm_web_platform_id }-${ var.vm_web_family }"
 name_db  = "${ var.vm_db_name }-${ var.vm_db_platform_id }-${ var.vm_db_family }"

}
```
Вывод из terraform console

terraform console
> local.name_web
"netology-develop-platform-web-standard-v3-ubuntu-2204-lts"
> local.name_db
"netology-develop-platform-db-standard-v3-ubuntu-2204-lts"


Задание 6


Задание 7
