
create materialized view view2 as
(select id_posto,nome,qtd_disp
from posto_de_saude inner join estoque on id_posto=fkid_posto
group by(id_posto,nome,qtd_disp)
having id_posto=some (select fkid_posto from estoque where qtd_disp >
0.5*(capacidade)))
with data
select * from view2


create view view1 as
select nome,cidade,dt_aplicacao,sum(n_doses)
from cartao_vacina as ct full outer join posto_de_saude on id_posto=fkid_posto join
enfermeiro_aplica_pessoa as eap on ct.fkid_pessoa=eap.fkid_pessoa
group by (nome,cidade,dt_aplicacao)
having sum(n_doses) < (select avg(n_doses) from cartao_vacina )
select * from view1


select p.cidade,p.nome,count(e.disponibilidade)
from enfermeiro e inner join posto_de_saude p on e.id_enfermeiro=p.fkid_enfermeiro
where e.disponibilidade='true'
group by(p.cidade,p.nome)
having count(e.disponibilidade) > 1
select id_vacina,nome_vacina,max(preco_lote)
from vacina
group by(id_vacina,nome_vacina)
limit 2
select id_cartao,grupo,count(*)
from cartao_vacina
group by(id_cartao,nome_vacinas)
having n_doses>=3 and nome_vacinas='fiocruz'

select cidade,nome,sum(capacidade)
from posto_de_saude inner join estoque on fkid_posto=id_posto
group by (cidade,nome)
having sum(capacidade) > 20000


CREATE or replace FUNCTION atualiza_o_dindin()
returns trigger
LANGUAGE PLPGSQL
AS
$$
DECLARE
var2 int;
begin
if new.saldo_mes < 0.3*old.saldo_mes then
select new.saldo_mes into var2;
raise notice 'saldo insuficiente paracompra de mais vacinas ';
return null;
end if;
return new;
end;
$$;



CREATE TRIGGER trigger_verifica_saldo
after update on governo
for each row
EXECUTE PROCEDURE atualiza_o_dindin()

EX: update governo set saldo_mes=55000 where id_governo=5


create or replace function compra_vacina()
returns trigger
language plpgsql
as
$$
DECLARE
var1 int;
begin
if new.qtd_disp<0.4*old.qtd_disp then
select new.qtd_disp into var1;
raise notice 'Necessario comprar mais vacinas';
return null;
end if;
return new;
end;
$$;

CREATE TRIGGER trigger_verifica_qtd
after update on estoque
for each row
EXECUTE PROCEDURE compra_vacina()

EX: update estoque set qtd_disp=5000 where id_estoque=200