Kata Simple lists
23 julio 2011

API de la lista
* find("item")
* add("item")
* values()
* delete("item")

Implementación  #1.
  Cada elemento de la lista apunta al siguiente.
  La lista apunta solamente al primer elemento.

Implementación #2
  Cada elemento de la lista apunta al anterior y al siguiente.
  La lista apunta solamente al primer elemento.

Refactorización General
  Ambas implementaciones comparten buena parte de las funciones.
  Se han creado clases "interface" y "abstract".

Implementación #3
  TO-DO
