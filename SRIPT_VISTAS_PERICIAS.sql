create view cases as
select Nombre,Apellido,jerarquia,pe.causa,pe.caratula
from personal as p 
join Pericia as pe on p.pk_id_personal = pe.FK_ID_Personal
select * from cases

create view Estado_ActivoxPericias as
select CAUSA,CARATULA,PEA.OBSERVACIONES from pericia as p
join Pericias_Estado_Activa as PEA on P.FK_ID_Estado_Finalizado = PEA.PK_ID_ESTADO_ACTIVA
SELECT * FROM Estado_FinalizadoxPericias

create view Estado_FinalizadoxPericias as
select  CAUSA,CARATULA,epf.OBSERVACIONES,archivo from pericia as p
join Estado_TIPO_FINAlizada as epf on
p.FK_ID_Estado_Finalizado = epf.PK_ESTADO_FINALIZADO
select * from Estado_ActivoxPericias
create view Falta_Material as
select  CAUSA,CARATULA,epf.OBSERVACIONES,archivo from pericia as p
join Estado_TIPO_FINAlizada as epf on
p.FK_ID_Estado_Finalizado = epf.PK_ESTADO_FINALIZADO
WHERE OBSERVACIONES = 'FALTA ENTREGAR MATERIAL'

select * from Falta_Material



create view Material_Entregado as
select  CAUSA,CARATULA,epf.OBSERVACIONES,archivo from pericia as p
join Estado_TIPO_FINAlizada as epf on
p.FK_ID_Estado_Finalizado = epf.PK_ESTADO_FINALIZADO
WHERE OBSERVACIONES != 'FALTA ENTREGAR MATERIAL'

select * from Material_Entregado
