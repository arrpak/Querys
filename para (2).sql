insert into fn2parametroproceso
values ('estimakio.bat', 1, 'Outputdef de un nodo de PV que se desea estimar. Ej: VentaMarca000000100002');
insert into fn2parametroproceso
values ('estimakio.bat', 2, 'Sesion de estimacion. Ej: 20001231.PV');
insert into fn2parametroproceso
values ('prevpack.bat', 1, 'Camino del fichero con los codigos de outputdef de punto de venta a prever');
insert into fn2parametroproceso
values ('prevpack.bat', 2, 'Sesion de prevision. Ej. 2000122431.PV');
insert into fn2parametroproceso
values ('modgloest.bat', 1, 'Outputdef de un nodopadre que se desea estimar. Ej: VentaMarcaCAMCAP');
insert into fn2parametroproceso
values ('modgloest.bat', 2, 'Sesion de estimacion. Ej: 20001231.PV');
insert into fn2parametroproceso
values ('modgloprev.bat', 1, 'Outputdef de un nodopadre que se desea prever. Ej: VentaMarcaCAMCAP');
insert into fn2parametroproceso
values ('modgloprev.bat', 2, 'Sesion de prevision. Ej. 2000122431.PV');
insert into fn2parametroproceso
values ('followestpv.bat', 1, 'Sesion de estimacion. Ej: 20001231.PV');
insert into fn2parametroproceso
values ('followprevpv.bat', 1, 'Sesion de prevision. Ej. 2000122431.PV');
insert into fn2parametroproceso
values ('llama.bat', 1, 'Mensaje a enviar.');
commit;