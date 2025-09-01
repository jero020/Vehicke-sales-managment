 Vehicle Sales Management System (Prolog)

 👥 Integrantes
- Jerónimo Vélez Acosta  
- Pablo Manjarres Negrette
 # 🎯 Objetivos de la práctica
1. Implementar un sistema en Prolog para gestionar un inventario de vehículos.  
2. Definir un catálogo de al menos 10 vehículos con atributos clave: **marca, referencia, tipo, precio y año**.  
3. Implementar consultas y filtros usando predicados como `findall/3` y `bagof/3`.  
4. Generar reportes que apliquen restricciones de presupuesto y valor total de inventario.  
5. Probar el sistema con casos de uso definidos.  

---
📚 Catálogo de vehículos
El inventario se definió con el predicado:  

```prolog
vehicle(Brand, Reference, Type, Price, Year).

