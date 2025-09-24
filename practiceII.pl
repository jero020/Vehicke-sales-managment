% ========================
% PARTE 1: VEHICLE CATALOG
% ========================

% vehicle(Brand, Reference, Type, Price, Year).

vehicle(toyota, corolla, sedan, 22000, 2022).
vehicle(toyota, camry, sedan, 27000, 2023).
vehicle(toyota, rav4, suv, 28000, 2022).
vehicle(ford, fiesta, sedan, 18000, 2021).
vehicle(ford, escape, suv, 26000, 2022).
vehicle(ford, ranger, pickup, 35000, 2023).
vehicle(ford, mustang, sport, 45000, 2023).
vehicle(bmw, series3, sedan, 42000, 2021).
vehicle(bmw, x5, suv, 60000, 2021).
vehicle(bmw, m4, sport, 70000, 2022).
vehicle(chevrolet, silverado, pickup, 40000, 2022).
vehicle(chevrolet, tahoe, suv, 55000, 2023).

% ==========================
% PARTE 2: QUERIES Y FILTROS
% ==========================

% 1. Filtrar por presupuesto (reference + precio <= presupuesto)
meet_budget(Reference, BudgetMax) :-
    vehicle(_, Reference, _, Price, _),
    Price =< BudgetMax.

% 2. Listar vehículos por marca usando findall/3 o bagof/3
vehicles_by_brand(Brand, Refs) :-
    findall(Ref, vehicle(Brand, Ref, _, _, _), Refs).

vehicles_grouped_by_brand(Brand, Grouped) :-
    bagof(Ref-Type-Year, vehicle(Brand, Ref, Type, _, Year), Grouped).

% ============================
% PARTE 3: GENERACIÓN DE REPORTES
% ============================

% generate_report(Brand, Type, Budget, Result).
% Result = lista de vehículos que cumplen condiciones
% + total del valor, ajustado a un límite global (1,000,000)

generate_report(Brand, Type, Budget, report(Vehicles, Total)) :-
    % Encontrar todos los vehículos que cumplen la condición
    findall((Brand, Ref, Type, Price, Year),
            (vehicle(Brand, Ref, Type, Price, Year), Price =< Budget),
            VehiclesAll),

    % Calcular el valor total inicial
    total_value(VehiclesAll, Total0),

    % Ajustar si excede el límite global (1,000,000)
    adjust_inventory(VehiclesAll, Total0, Vehicles, Total).

% Calcular valor total de una lista de vehículos
total_value([], 0).
total_value([(_,_,_,Price,_)|T], Total) :-
    total_value(T, Sub),
    Total is Price + Sub.

% Ajustar inventario si excede el límite
adjust_inventory(Vehicles, Total, Vehicles, Total) :-
    Total =< 1000000, !.

adjust_inventory(Vehicles, _, Adjusted, TotalAdj) :-
    % Ordenar por precio ascendente
    sort(4, @=<, Vehicles, Sorted),  % clave: columna 4 (precio)
    take_until_limit(Sorted, 1000000, Adjusted, TotalAdj).

% Seleccionar vehículos mientras no excedan el límite
take_until_limit([], _, [], 0).
take_until_limit([(_,_,_,Price,_)|_], Limit, [], 0) :-
    Price > Limit, !.
take_until_limit([(B,R,T,Price,Y)|Rest], Limit, [(B,R,T,Price,Y)|Sel], Total) :-
    NewLimit is Limit - Price,
    take_until_limit(Rest, NewLimit, Sel, SubTotal),
    Total is Price + SubTotal.
