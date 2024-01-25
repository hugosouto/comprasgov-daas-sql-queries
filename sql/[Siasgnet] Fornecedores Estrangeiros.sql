SELECT DISTINCT
	 mo.descricao						Modalidade
	,l.anolicitacao 					LicitacaoAno
	,l.objeto							Objeto
	,l.codigouasg						CodigoUasg
	,SUM(li.valorestimado)				ValorEstimado
	,SUM(pr.valoritem)					ValorHomologado
	,l.situacao							StatusLicitacao
	,l.codigolicitacao
	,l.tipolicitacao
--	,l.numeroprocesso
	,l.srp
--	,l.prazosrp
	,l.internacional
	,l.numerolicitacao
--	,l.recursopendente
--	,l.contadorreaberturadocumentacao
--	,l.situacaoanterior
--	,l.datahoraregistro
--	,li.codigoitem
--	,li.codigolicitacao
--	,li.descricao
--	,li.quantidade
--	,li.numero
--	,li.unidadefornecimento
--	,li.revogado
--	,li.justificativarevogacao
--	,li.situacaohomologacao
--	,li.justificativanaohomologacao
--	,li.codigomatserv
--	,li.tipobeneficio
--	,li.criteriojulgamento
--	,li.peminimosubcontratacao
--	,li.pemaximosubcontratacao
--	,li.codigoitempai
--	,li.justificativaanulacao
--	,li.justifsubmeterrevogacao
--	,li.justifdiscordsubmeterrevogacao
--	,li.aplicadecreto7174
--	,li.tipoitem
--	,li.pemargempreferencianormal
--	,li.pemargempreferenciaadicional
--	,li.datahoraregistro
--	,pr.codigoproposta
--	,pr.codigoitem
--	,pr.codigoparticipante
--	,pr.marca
--	,pr.fabricante
--	,pr.quantidade
--	,pr.resultado
--	,pr.situacaopropostapreco
--	,pr.situacaopropostatecnica
--	,pr.justificativadesclassificacaopreco
--	,pr.justificativadesclassificacaotecnica
--	,pr.descricaocomplementar
--	,pr.vencedora
--	,pr.valornegociadounitario
--	,pr.pontuacaotecnica
--	,pr.datahoraregistro
--	,pr.justificativanegociacao
--	,pr.valordesconto
--	,pr.valorunitariodesempate
--	,pr.valorglobaldesempate
--	,pr.valordescontodesempate
--	,pr.assumidocota
--	,pr.situacaoempate
--	,pr.situacaosubcontratadas
--	,pr.justificativanaosubcontratacao
--	,pr.classificacaojulgamento
--	,pr.valornegociadodesconto
--	,pr.valornegociadoglobal
--	,pr.valorunitariodesempate7174
--	,pr.valorglobaldesempate7174
--	,pr.valordescontodesempate7174
--	,pr.situacaoempate7174
--	,pr.fezdeclaracaotp
--	,pr.fezdeclaracaoppb
--	,pr.fezdeclaracaoprodutonacional
--	,pr.codigopaisorigem
--	,pa.codigoparticipante
	,pa.codigofornecedor
--	,pa.codigolicitacao
--	,pa.justificativanaohabilitacao
--	,pa.situacaoparticipante
--	,pa.fezdeclaracaome
--	,pa.datahorasituacao
FROM Siasgnet_sp_VBL.licitacao l
	,Siasgnet_sp_VBL.licitacaoitem li 
	,Siasgnet_sp_VBL.proposta pr
	,Siasgnet_sp_VBL.participante pa
	,Siasgnet_sp_VBL.fornecedor f
	,Siasgnet_VBL.modalidadecompra mo
WHERE 1=1
	-- Chaves
	AND li.codigolicitacao = l.codigolicitacao
	AND pr.codigoitem = li.codigoitem
	AND pa.codigoparticipante = pr.codigoparticipante
	AND f.codigofornecedor = pa.codigofornecedor 
	AND l.codigomodalidade = mo.codigomodalidadecompra
	-- Condições
	AND internacional = 'T'
GROUP BY
	mo.descricao, l.anolicitacao, l.objeto, l.codigouasg, l.situacao, l.codigolicitacao, l.tipolicitacao, l.srp, l.internacional, l.numerolicitacao, pa.codigofornecedor
;