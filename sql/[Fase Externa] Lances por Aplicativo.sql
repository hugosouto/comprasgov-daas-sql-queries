select l.origem, count(distinct l.id)
from ComprasGov_SalaDisputa_VBL.lance as l
where 1=1
	and l.origem_sessao_usuario = 'A'
	and l.data_hora_inclusao between '2024-01-01' and '2024-01-10'
group by l.origem