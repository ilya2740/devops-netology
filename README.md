# devops-netologyFirst_String

File that will be ignored during commit because they are  pointed  out in  file  .gitignore:

1. Files that located in  "terraform"  directory.
2. Log files (files with ".log"  extentions)
3. Files that contains sensitive data  ( .tfvars , .tfvars.json )
4. Files  that override  config   (override.tf)
5. Configuration  files ( terraform.rc )




Домашнее задание к занятию «Инструменты Git»

Вопрос 1.
Коммит - aefead
Полный хэш - aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Комментарий - Update CHANGELOG.md
Команда - git log --oneline | grep aefea


Вопрос2.

 Тег коммита 85024d3 -  tag: v0.12.23
 Команда - git show 85024d3
 
 У коммита b8d720  2 родителей -  56cd7859e0 (56cd7859e05c36c06b56d013b55a252d0bb7e158) и 9ea88f22fc (9ea88f22fc6269854151c571162c5bcf958bee2b)
 Команда -  git show b8d720   или   git log b8d720 --graph
 
 Хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.
 33ff1c03bb960b332be3af2e333462dde88b279e (tag: v0.12.24) v0.12.24
b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links
3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md
6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location
06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md
d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows
4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md
dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
225466bc3e5f35baa5d07197bbc079345b77525e Cleanup after v0.12.23 release
 
 Команда  git log v0.12.23..v0.12.24 --pretty=oneline
 
 
 
 
  Коммиты, в которых была изменена функция globalPluginDirs
 1. Находим файлы в которых содержится функция  globalPluginDirs.
 Git grep  --count   globalPluginDirs
commands.go:2
internal/command/cliconfig/config_unix.go:1
plugins.go:2
 2. Находим комиты в которых была изменена функция globalPluginDirs.

 Git log -L :globalPluginDirs:commands.go
fatal: -L parameter 'globalPluginDirs' starting at line 1: no match
 
 Git log -L :globalPluginDirs:internal/command/cliconfig/config_unix.go
fatal: -L parameter 'globalPluginDirs' starting at line 1: no match
 
 git log -L :globalPluginDirs:plugins.go | grep commit 
commit 78b12205587fe839f10d946ea3fdc06719decb05
commit 52dbf94834cb970b510f2fba853a5b49ad9b1a46
commit 41ab0aef7a0fe030e84018973a64135b11abcd70
commit 66ebff90cdfaa6938f26f908c7ebad8d547fea17
commit 8364383c359a6b738a436d1b7745ccdce178df47

 
 
 Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func providerSource(...) (вместо троеточия перечислены аргументы).
 Не смог найти решения для данной задачи. Прошу направить в нужном направлении.
 

 
 Автор функции synchronizedWriters
 
 По моему мнению автор функции  synchronizedWriters  - Martin Atkins  поскольку он указан автором первого комита в котором была найдена функция.
 
 git log -SsynchronizedWriters --pretty=format"%h  %an  %ar %s"
 
formatbdfea50cc8  James Bardin  2 года, 5 месяцев назад remove unused
formatfd4f7eb0b9  James Bardin  2 года, 6 месяцев назад remove prefixed io
format5ac311e2a9  Martin Atkins  6 лет назад main: synchronize writes to VT100-faker on Windows

