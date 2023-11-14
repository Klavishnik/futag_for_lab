## ТЕОРИЯ. 
### Что это?
Этот проект предназначен для автоматической генерации фаззинг оберток для функций библиотек и их фаззинга.
Для этого используется проект Futag от ИСП РАН.

###  Зачем?
Для автоматизации тестирования библиотек.
Конкретно этот проект предназачен для тестирования либораторных работ 3+.

### Для кого?
Для студентов и преподавателей.

## ПРАКТИКА

### Подготовка проекта
В папку `project` положить `main.c`, в папаку `lib` - файлы бибилиотек (`.h` и `.c`) 

### Сборка базового образа
Здесь собирается сам Futag и все необходимое для его работы.

**!!!! Займет около часа !!!**

*Если у Вас уже есть базовый образ, тот этот пункт можно пропустить*

```bash
cd docker/
./Docker-test-build.sh
```


## ЗАПУСК
При работе с контенером папка project будет **примонтирована** к контенейру (т.е. все изменения в ней останутся и на хостовой машине).

Есть два пути анализа приложения:

### Запуск ИНТЕРАКТИВНОГО  контейнера 
(Это может понадобится для отладки в самом контейнере)

```bash
cd docker/
./Docker-test-build-run_attach.sh
```
После этого вы окажитесь в контенейре. 

#### Запуск анализа, компиляции и фаззинга
```bash
cd /home/user/
./start.sh
```

### Запуск контейнера в ФОНЕ
(Это может понадобится для отладки в самом контейнере)

```bash
cd docker/
./Docker-test-build-run.sh
```
После этого вы увидите вывод работы программы.

## РЕЗУЛЬТАТЫ

Результаты анализа, скомпилированные обертки и краши будут лежать по адресу:

```bash
project/futag-fuzz-drivers/<НАЗВАНИЕ_ФНУКЦИИ>/<НАЗВАНИЕ_ОБЕРТИК>
```

## Reference
https://github.com/ispras/Futag
