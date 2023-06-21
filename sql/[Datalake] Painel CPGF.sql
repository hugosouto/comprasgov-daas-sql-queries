SELECT 
	t.codigoTransacao,
	t.codigoUg,
	t.extrato,
	t.transacao,
	t.tipoTransacao,
	t.dataTransacao,
	t.valor,
	t.sigilo,
	t.cpfResponsavelTransacao,
	t.nomeResponsavelTransacao,
	t.numeroCartao,
	t.dataCarga,
	t.tipoSaldo,
	t.intercambioVisa,
	tn.codigoTNotaFiscal,
	tn.codigoTransacao,
	tn.codigoNotaFiscal,
	tn.dataInclusao,
	tn.valorTransacao,
	n.codigoNotaFiscal,
	n.codigoMunicipioAplicacao,
	n.codigoCnae,
	n.numeroNotaFiscal,
	n.cnpj,
	n.razaoSocial,
	n.dataEmissao,
	n.estado,
	n.transacaoSemNotaFiscal,
	n.descricaoCnae,
	n.valorTotal,
--	n.bairro,
	n.cep,
--	n.endereco,
	n.indConclusao,
	n.codigoJustificativa,
	n.justificativa,
	n.desconto,
	n.indDetalhamentoItem,
	n.tipoDocumento
--	nfi.codigoNotaFiscalItem,
--	nfi.codigoNotaFiscal,
--	nfi.codigoMaterialServico,
--	nfi.item,
--	nfi.unidade,
--	nfi.quantidade,
--	nfi.descricaoMaterialServico,
--	nfi.valorUnitario,
--	nfi.valorItem,
--	nfi.objetivo,
--	nfi.materialServico
FROM Stg_Cartao_Corp.dbo.CPGF_Transacao 					t
	 JOIN Stg_Cartao_Corp.dbo.CPGF_Transacao_NotaFiscal 	tn 	ON t.codigoTransacao = tn.codigoTransacao
	 JOIN Stg_Cartao_Corp.dbo.CPGF_NotaFiscal 				n	ON n.codigoNotaFiscal = tn.codigoNotaFiscal
--	 LEFT JOIN Stg_Cartao_Corp.dbo.CPGF_NotaFiscalItem 			nfi	ON n.codigoNotaFiscal = nfi.codigoNotaFiscal
--	 LEFT JOIN Stg_Cartao_Corp.dbo.CPGF_Justificativa 			j	ON n.codigoJustificativa = j.codigoJustificativa
--	 LEFT JOIN Stg_Cartao_Corp.dbo.CPGF_NotaFiscalOriginal 		nfo	ON nfo.codigoTransacao = t.codigoTransacao
--	 LEFT JOIN Stg_Cartao_Corp.dbo.CPGF_NotaFiscalAnexo 		nfa	ON nfa.codigoNotaFiscal = n.codigoNotaFiscal
WHERE t.dataTransacao BETWEEN '2019-01-01 00:00:00' AND'2020-01-01 00:00:00';

SELECT
	t.nomeResponsavelTransacao,
	SUM(t.valor)
--	t.codigoTransacao,
--	t.codigoUg,
--	t.extrato,
--	t.transacao,
--	t.tipoTransacao,
--	t.dataTransacao,
--	t.valor,
--	t.sigilo,
--	t.cpfResponsavelTransacao,
--	t.nomeResponsavelTransacao,
--	t.numeroCartao,
--	t.dataCarga,
--	t.tipoSaldo,
--	t.intercambioVisa,
--	tn.codigoTNotaFiscal,
--	tn.codigoTransacao,
--	tn.codigoNotaFiscal,
--	tn.dataInclusao,
--	tn.valorTransacao,
--	n.codigoNotaFiscal,
--	n.codigoMunicipioAplicacao,
--	n.codigoCnae,
--	n.numeroNotaFiscal,
--	n.cnpj,
--	n.razaoSocial,
--	n.dataEmissao,
--	n.estado,
--	n.transacaoSemNotaFiscal,
--	n.descricaoCnae,
--	n.valorTotal,
----	n.bairro,
--	n.cep,
----	n.endereco,
--	n.indConclusao,
--	n.codigoJustificativa,
--	n.justificativa,
--	n.desconto,
--	n.indDetalhamentoItem,
--	n.tipoDocumento
--	nfi.codigoNotaFiscalItem,
--	nfi.codigoNotaFiscal,
--	nfi.codigoMaterialServico,
--	nfi.item,
--	nfi.unidade,
--	nfi.quantidade,
--	nfi.descricaoMaterialServico,
--	nfi.valorUnitario,
--	nfi.valorItem,
--	nfi.objetivo,
--	nfi.materialServico
FROM Stg_Cartao_Corp.dbo.CPGF_Transacao 					t
	 JOIN Stg_Cartao_Corp.dbo.CPGF_Transacao_NotaFiscal 	tn 	ON t.codigoTransacao = tn.codigoTransacao
	 JOIN Stg_Cartao_Corp.dbo.CPGF_NotaFiscal 				n	ON n.codigoNotaFiscal = tn.codigoNotaFiscal
--	 LEFT JOIN Stg_Cartao_Corp.dbo.CPGF_NotaFiscalItem 			nfi	ON n.codigoNotaFiscal = nfi.codigoNotaFiscal
--	 LEFT JOIN Stg_Cartao_Corp.dbo.CPGF_Justificativa 			j	ON n.codigoJustificativa = j.codigoJustificativa
--	 LEFT JOIN Stg_Cartao_Corp.dbo.CPGF_NotaFiscalOriginal 		nfo	ON nfo.codigoTransacao = t.codigoTransacao
--	 LEFT JOIN Stg_Cartao_Corp.dbo.CPGF_NotaFiscalAnexo 		nfa	ON nfa.codigoNotaFiscal = n.codigoNotaFiscal
WHERE t.dataTransacao BETWEEN '2019-01-01 00:00:00' AND'2020-01-01 00:00:00'
GROUP BY t.nomeResponsavelTransacao