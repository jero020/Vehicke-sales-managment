# Vehicle Catalog System - Prolog

https://www.youtube.com/watch?v=h56FjVaN2So

## 📌 Descripción
Este proyecto implementa un sistema de gestión y consulta de un **catálogo de vehículos** utilizando Prolog.  
Permite almacenar información de diferentes marcas y referencias de autos, aplicar filtros por presupuesto, agrupar por marca y tipo, y generar reportes con un inventario ajustado a un límite global.

## 📂 Estructura del código

### **Parte 1: Base de Conocimiento**
Se define la base de datos de vehículos con el predicado:
```prolog
vehicle(Brand, Reference, Type, Price, Year).
```
Ejemplo:
```prolog
vehicle(toyota, corolla, sedan, 22000, 2022).
```

### **Parte 2: Consultas y Filtros**
1. **Filtrar por presupuesto:**
   ```prolog
   meet_budget(Reference, BudgetMax).
   ```
   Retorna las referencias con precio menor o igual al presupuesto.

2. **Listar vehículos por marca:**
   - Con `findall/3`:
     ```prolog
     vehicles_by_brand(Brand, Refs).
     ```
     Devuelve una lista de referencias de la marca dada.
   - Con `bagof/3`:
     ```prolog
     vehicles_grouped_by_brand(Brand, Grouped).
     ```
     Devuelve referencias agrupadas con tipo y año.

### **Parte 3: Generación de Reportes**
El predicado principal es:
```prolog
generate_report(Brand, Type, Budget, report(Vehicles, Total)).
```
- Filtra vehículos por **marca**, **tipo** y **presupuesto**.
- Calcula el valor total del inventario.
- Ajusta la selección si el total excede el límite global de **1,000,000**.

Funciones auxiliares:
- `total_value/2`: Suma los precios de una lista de vehículos.  
- `adjust_inventory/4`: Ajusta el inventario si excede el límite global.  
- `take_until_limit/4`: Selecciona vehículos hasta cumplir con el límite.  

## 🚀 Ejemplos de uso

1. **Filtrar por presupuesto:**
```prolog
?- meet_budget(corolla, 25000).
true.
```

2. **Listar vehículos por marca:**
```prolog
?- vehicles_by_brand(toyota, Refs).
Refs = [corolla, camry, rav4].
```

3. **Generar reporte con presupuesto:**
```prolog
?- generate_report(ford, suv, 30000, Report).
Report = report([(ford, escape, suv, 26000, 2022)], 26000).
```

## 👨‍💻 Autores
- Pablo Manjarres  
- Jerónimo Vélez  

