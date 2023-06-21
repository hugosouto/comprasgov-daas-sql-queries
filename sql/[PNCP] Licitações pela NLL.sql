SELECT
  c.id
, o.cnpj||'-1-'||LPAD(c.sequencialcompra,6,0)||'/'||c.anocompra AS id_contratacao  
, Case when c.modalidadeid = 1 then 'Leilão'
       when c.modalidadeid = 2 then 'Diálogo Competitivo'
          when c.modalidadeid = 3 then 'Concurso'
       when c.modalidadeid = 4 then 'Concorrência - Eletrônica'
          when c.modalidadeid = 5 then 'Concorrência - Presencial'
       when c.modalidadeid = 6 then 'Pregão - Eletrônico'
       when c.modalidadeid = 7 then 'Pregão - Presencial'
       when c.modalidadeid = 8 then 'Dispensa'
       when c.modalidadeid = 9 then 'Inexigibilidade'
       when c.modalidadeid = 10 then 'Manifestação de Interesse'
       when c.modalidadeid = 11 then 'Pré-qualificação'
       else 'Credenciamento' end modalidade
, c.numerocompra
, c.anocompra
, c.processo
, c.objetocompra
, c.informacaocomplementar
, c.srp
, c.datapublicacaopncp
, Case When c.situacaocompraid = 1 then 'Divulgada no PNCP'
       When c.situacaocompraid = 2 then 'Revogada'
       When c.situacaocompraid = 3 then 'Anulada'
       else 'Suspensa' end situacaocompra
, us.nomerazaosocial
, Case When c.tipoinstrumentoconvocatorioid = 1 then 'Edital'
       When c.tipoinstrumentoconvocatorioid = 2 then 'Aviso de Contratação Direta'
       else 'Ato que autoriza a Contratação Direta' end tipoinstrumentoconvocatorio
, o.razaosocial as orgao
, un.codigounidade
, un.nomeunidade as unidadeorgao
, mu.uf
, mu.municipio 
, (SELECT o.razaosocial FROM orgao o WHERE c.orgaosubrogadoid = o.id) AS orgaosubrogado
, (SELECT un.nomeunidade FROM unidadeorgao un WHERE c.unidadesubrogadaid = un.id) AS unidadesubrogada
, c.orcamentosigiloso
, Case When c.mododisputaid = 1 then 'Aberto'
       When c.mododisputaid = 2 then 'Fechado'
       When c.mododisputaid = 3 then 'Aberto-Fechado'
       When c.mododisputaid = 4 then 'Dispensa Com Disputa'
       else 'Não se aplica' end mododisputa
, c.dataaberturaproposta
, c.dataencerramentoproposta
, am.nome
, c.linksistemaorigem
FROM compra c
Inner join usuario us
ON us.id = c.usuarioid
Inner join orgao o
ON  o.id = c.orgaoid
Inner join unidadeorgao un
ON un.id = c.unidadeorgaoid
Inner join municipio mu
ON un.municipioid = mu.id
Inner join amparolegal am
ON am.id = c.amparolegalid
Where 
c.usuarioid = 3 and c.tipoinstrumentoconvocatorioid = 1 and
c.excluido = 0;