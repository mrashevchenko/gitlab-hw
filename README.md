# Домашнее задание к занятию 10.2 «Кластеризация» - `Rashevchenko Mikhail`
**
---
### Задание 1

В чём различие между SMP- и MPP-системами?

В отличии от SMP с общей физической памятью в MPP память разделена совместо с отдельными ЦП которые соедиеннены спецвльных коммуникационными каналами. С точки зрения пользователя, это можно считать серверной системой. SMP плохо масштабируется, а MPP имеет более сниженную скорость медпроцессорного обемеа, ограниченные ресурсы памяти у каждого процессора и высокая цена.
---
### Задание 2

В чём отличие сильно связанных и слабо связанных систем?

Отличие между слабо связанных и сильно связанных системой в том, что слабо связанная система использует распределенную память, а сильно связанная общую память.
Из-за чего слабо связанная не сталкивается с конфлиткам памяти который просиходит в сильно связанной системе. Так же из-за этого у них и разная скорость перадчи данных, низкая у слабо связанно - выстокая в сильно связанной.
---
### Задание 3

Какие преимущества отличают кластерные системы от обычных серверов?

Кластерная система это обьеденные сервера или компьютеры которые независимо от место расположения физически обьеденные в одну целую систему в отличие от обычного сервера. Отказоуствойчивость это главное преимущество, а именно сохранение работоспособности не зависимо от одной из составляющих кластера. В кластере ресурсы в виде баз и бекапов распростренены и дублируется что помогает востановить их не смотря на выход из строя одного из обьектов в кластере. Удобность так же в расширение ресурсов и масштабируемости.
---
### Задание 4

Приведите примеры типов современных кластерных систем.

Отказоустойчивые кластеры (High-availability clusters, HA, кластеры высокой доступности) - Для обеспечения высокой доступности сервиса, больше узлов больше отказойстойчивость.
Кластеры с балансировкой нагрузки (Load balancing clusters) - работают с распеределение запросов для перенаправления обратки данных в вычеслительные узлы.
Вычислительные кластеры (High performance computing clusters, HPC) - Для научных целей и расчетных задач, массив серверов в стойке.
Системы распределенных вычислений - системы с спользование компьютеров обьеденные в одну выселительную систему, grid-системы или виртуальный супер компьютер в виде кластера которые находиться на разных компьютерах которые помогают в виде предоставления своих ресурсов. 
---
### Задание 5

Где используют сервис Kafka, rabitMQ?

Kafka - используют хранения, чтения и повторного чтения потоковых данных так же для обработки и анализа данных в режиме реального времени. Можно встретитьв онлайн играх или социальных сетях
rabitMQ - длительных задач, высокопроизводительных фоновых заданий и интеграции между приложениями и внутри них. Можно встретить в системах бронирования билетов.
---
