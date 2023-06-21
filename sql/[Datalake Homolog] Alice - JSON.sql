SELECT
	id 						AS 'id',
	texto					AS 'texto',
	valor_total_estimado	AS 'valor_total_estimado',
	uasg					AS 'uasg',
	categoria				AS 'categoria',
	id_categoria			AS 'id_categoria',
	equipe_cpf				AS 'equipe_cpf',
	tipo_trilha				AS 'tipo_trilha',
	'email_alerta'			AS 'email_alerta'
FROM seges_delog_cgscg_stage.alice.etp_teste2 a
FOR JSON PATH
LIMIT 100;

{
    "id": 74459,
    "texto": "6.1 - Bens e Serviços que Compõem a Solução Serviço/Bem Descrição Estimativa (mês) Previsão Anual Total (Ano) Serviço de Suporte e Atendimento em TIC ao Usuário (Service Desk) Prestação de serviços de suporte técnico de microinformática ao usuário final, em 1º, 2º e 3º níveis, incluindo a sustentação dos ativos e dos softwares relacionados às atividades meio e finalísticas do Cemaden, contribuindo assim para manter em funcionamento as operações e funções de suas diversas áreas, em especial da Sala de Situação do Centro, operando em regime de 24h/7d. 5870 (UST) 70440 (UST) R$ 1.992.043,20 Total = R$ 1.992.043,20 | 6 - Cenário Escolhido Cenário x Descrição Após análise dos Cenários, a solução que mais se adequa às necessidades do Cemaden é equivalente à implementada pelo MAPA (Cenário 1) e pelo INPE (Cenário 4). [...]",
    "valor_total_estimado": 30000000.0,
    "categoria": "Contratações de TIC",
    "id_categoria": 3,
    "uasg": 130005,
    "equipe_cpf": ["30000000075"],
    "tipo_trilha": "etp"
}