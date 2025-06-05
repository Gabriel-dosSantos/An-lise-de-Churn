--Explorando de dados � Checando valores distintos
SELECT Gender, Count(Gender) as TotalCount,
Count(Gender) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from stg_Churn
Group by Gender

SELECT Contract, Count(Contract) as TotalCount,
Count(Contract) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from stg_Churn
Group by Contract


SELECT Customer_Status, Count(Customer_Status) as TotalCount, Sum(Total_Revenue) as TotalRev,
100.0 * Sum(Total_Revenue) / (Select sum(Total_Revenue) from stg_Churn) as RevPercentage
from stg_Churn
Group by Customer_Status

SELECT 
Total_Revenue AS Rev_Month,
	(100.0 * SUM(CASE WHEN Customer_Status = 'Ativo' THEN 1 ELSE 0 END) / COUNT (*)) AS Percent_Nao_Churn,
	(100.0 * SUM(CASE WHEN Customer_Status = 'Churn' THEN 1 ELSE 0 END) / COUNT (*)) AS Percent_Churn,
	 COUNT(*) AS Total_Customer
FROM stg_Churn
GROUP BY Total_Revenue
ORDER BY Total_Revenue

SELECT State, Count(State) as TotalCount,
Count(State) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from stg_Churn
Group by State
Order by Percentage desc



--Explorando de dados � Checando Nulos
SELECT 
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM stg_Churn;



--Traduzindo para PT-BR - Nome colunas 
EXEC sp_rename 'stg_Churn.Customer_ID', 'ID_Cliente', 'COLUMN';
EXEC sp_rename 'stg_Churn.Gender', 'Genero', 'COLUMN';
EXEC sp_rename 'stg_Churn.Age', 'Idade', 'COLUMN';
EXEC sp_rename 'stg_Churn.Married', 'Casado', 'COLUMN';
EXEC sp_rename 'stg_Churn.State', 'Estado', 'COLUMN';
EXEC sp_rename 'stg_Churn.Number_of_Referrals', 'Numero_de_Indicacoes', 'COLUMN';
EXEC sp_rename 'stg_Churn.Tenure_in_Months', 'Tempo_de_Contrato_Meses', 'COLUMN';
EXEC sp_rename 'stg_Churn.Value_Deal', 'Valor_de_Oferta', 'COLUMN';
EXEC sp_rename 'stg_Churn.Phone_Service', 'Servico_Telefonico', 'COLUMN';
EXEC sp_rename 'stg_Churn.Multiple_Lines', 'Multiplas_Linhas', 'COLUMN';
EXEC sp_rename 'stg_Churn.Internet_Service', 'Servico_de_Internet', 'COLUMN';
EXEC sp_rename 'stg_Churn.Internet_Type', 'Tipo_de_Internet', 'COLUMN';
EXEC sp_rename 'stg_Churn.Online_Security', 'Seguranca_Online', 'COLUMN';
EXEC sp_rename 'stg_Churn.Online_Backup', 'Backup_Online', 'COLUMN';
EXEC sp_rename 'stg_Churn.Device_Protection_Plan', 'Protecao_de_Dispositivo', 'COLUMN';
EXEC sp_rename 'stg_Churn.Premium_Support', 'Suporte_Premium', 'COLUMN';
EXEC sp_rename 'stg_Churn.Streaming_TV', 'TV_Stream', 'COLUMN';
EXEC sp_rename 'stg_Churn.Streaming_Movies', 'Filmes_Stream', 'COLUMN';
EXEC sp_rename 'stg_Churn.Streaming_Music', 'Musica_Stream', 'COLUMN';
EXEC sp_rename 'stg_Churn.Unlimited_Data', 'Dados_Ilimitados', 'COLUMN';
EXEC sp_rename 'stg_Churn.Contract', 'Contrato', 'COLUMN';
EXEC sp_rename 'stg_Churn.Paperless_Billing', 'Fatura_Digital', 'COLUMN';
EXEC sp_rename 'stg_Churn.Payment_Method', 'Metodo_Pagamento', 'COLUMN';
EXEC sp_rename 'stg_Churn.Monthly_Charge', 'Valor_Mensal', 'COLUMN';
EXEC sp_rename 'stg_Churn.Total_Charges', 'Total_Cobrado', 'COLUMN';
EXEC sp_rename 'stg_Churn.Total_Refunds', 'Total_Reembolsado', 'COLUMN';
EXEC sp_rename 'stg_Churn.Total_Extra_Data_Charges', 'Total_Cobrancas_Extras_Dados', 'COLUMN';
EXEC sp_rename 'stg_Churn.Total_Long_Distance_Charges', 'Total_Cobrancas_LD', 'COLUMN';
EXEC sp_rename 'stg_Churn.Total_Revenue', 'Receita_Total', 'COLUMN';
EXEC sp_rename 'stg_Churn.Customer_Status', 'Status_Cliente', 'COLUMN';
EXEC sp_rename 'stg_Churn.Churn_Category', 'Categoria_Churn', 'COLUMN';
EXEC sp_rename 'stg_Churn.Churn_Reason', 'Motivo_Churn', 'COLUMN';





--Traduzindo para PT-BR � Dados das Colunas
UPDATE stg_Churn
SET
    Genero = CASE WHEN Genero = 'Female' THEN 'Feminino' WHEN Genero = 'Male' THEN 'Masculino' ELSE Genero END,
    Casado = CASE WHEN Casado = 'Yes' THEN 'Sim' WHEN Casado = 'No' THEN 'N�o' ELSE Casado END,
    Valor_de_Oferta = CASE 
        WHEN Valor_de_Oferta = 'Deal 1' THEN 'Oferta 1'
        WHEN Valor_de_Oferta = 'Deal 2' THEN 'Oferta 2'
        WHEN Valor_de_Oferta = 'Deal 3' THEN 'Oferta 3'
        WHEN Valor_de_Oferta = 'Deal 4' THEN 'Oferta 4'
        WHEN Valor_de_Oferta = 'Deal 5' THEN 'Oferta 5'
        ELSE Valor_de_Oferta END,
    Servico_Telefonico = CASE WHEN Servico_Telefonico = 'Yes' THEN 'Sim' WHEN Servico_Telefonico = 'No' THEN 'N�o' ELSE Servico_Telefonico END,
    Multiplas_Linhas = CASE WHEN Multiplas_Linhas = 'Yes' THEN 'Sim' WHEN Multiplas_Linhas = 'No' THEN 'N�o' ELSE Multiplas_Linhas END,
    Servico_de_Internet = CASE WHEN Servico_de_Internet = 'Yes' THEN 'Sim' WHEN Servico_de_Internet = 'No' THEN 'N�o' ELSE Servico_de_Internet END,
    Tipo_de_Internet = CASE 
        WHEN Tipo_de_Internet = 'DSL' THEN 'ADSL'
        WHEN Tipo_de_Internet = 'Fiber Optic' THEN 'Fibra �ptica'
        WHEN Tipo_de_Internet = 'Cable' THEN 'Cabo'
        ELSE Tipo_de_Internet END,
    Seguranca_Online = CASE WHEN Seguranca_Online = 'Yes' THEN 'Sim' WHEN Seguranca_Online = 'No' THEN 'N�o' ELSE Seguranca_Online END,
    Backup_Online = CASE WHEN Backup_Online = 'Yes' THEN 'Sim' WHEN Backup_Online = 'No' THEN 'N�o' ELSE Backup_Online END,
    Protecao_de_Dispositivo = CASE WHEN Protecao_de_Dispositivo = 'Yes' THEN 'Sim' WHEN Protecao_de_Dispositivo = 'No' THEN 'N�o' ELSE Protecao_de_Dispositivo END,
    Suporte_Premium = CASE WHEN Suporte_Premium = 'Yes' THEN 'Sim' WHEN Suporte_Premium = 'No' THEN 'N�o' ELSE Suporte_Premium END,
    TV_Stream = CASE WHEN TV_Stream = 'Yes' THEN 'Sim' WHEN TV_Stream = 'No' THEN 'N�o' ELSE TV_Stream END,
    Filmes_Stream = CASE WHEN Filmes_Stream = 'Yes' THEN 'Sim' WHEN Filmes_Stream = 'No' THEN 'N�o' ELSE Filmes_Stream END,
    Musica_Stream = CASE WHEN Musica_Stream = 'Yes' THEN 'Sim' WHEN Musica_Stream = 'No' THEN 'N�o' ELSE Musica_Stream END,
    Dados_Ilimitados = CASE WHEN Dados_Ilimitados = 'Yes' THEN 'Sim' WHEN Dados_Ilimitados = 'No' THEN 'N�o' ELSE Dados_Ilimitados END,
    Contrato = CASE 
        WHEN Contrato = 'Month-to-Month' THEN 'M�s-a-m�s'
        WHEN Contrato = 'One Year' THEN 'Um Ano'
        WHEN Contrato = 'Two Year' THEN 'Dois Anos'
        ELSE Contrato END,
    Fatura_Digital = CASE WHEN Fatura_Digital = 'Yes' THEN 'Sim' WHEN Fatura_Digital = 'No' THEN 'N�o' ELSE Fatura_Digital END,
    Metodo_Pagamento = CASE 
        WHEN Metodo_Pagamento = 'Bank Withdrawal' THEN 'D�bito em Conta'
        WHEN Metodo_Pagamento = 'Credit Card' THEN 'Cart�o de Cr�dito'
        WHEN Metodo_Pagamento = 'Mailed Check' THEN 'Boleto'
        ELSE Metodo_Pagamento END,
    Status_Cliente = CASE
        WHEN Status_Cliente = 'Churned' THEN 'Churn'
        WHEN Status_Cliente = 'Stayed' THEN 'Ativo'
        WHEN Status_Cliente = 'Joined' THEN 'Ingressou'
        ELSE Status_Cliente END,
    Categoria_Churn = CASE
        WHEN Categoria_Churn = 'Attitude' THEN 'Atitude'
        WHEN Categoria_Churn = 'Competitor' THEN 'Concorrente'
        WHEN Categoria_Churn = 'Dissatisfaction' THEN 'Insatisfa��o'
        WHEN Categoria_Churn = 'Other' THEN 'Outro'
        WHEN Categoria_Churn = 'Price' THEN 'Pre�o'
        ELSE Categoria_Churn END,
    Motivo_Churn = CASE
        WHEN Motivo_Churn = 'Attitude of service provider' THEN 'Atitude do provedor de servi�o'
        WHEN Motivo_Churn = 'Attitude of support person' THEN 'Atitude do atendente de suporte'
        WHEN Motivo_Churn = 'Competitor had better devices' THEN 'Concorrente tinha dispositivos melhores'
        WHEN Motivo_Churn = 'Competitor made better offer' THEN 'Concorrente fez uma oferta melhor'
        WHEN Motivo_Churn = 'Competitor offered higher download speeds' THEN 'Concorrente ofereceu velocidades de download maiores'
        WHEN Motivo_Churn = 'Competitor offered more data' THEN 'Concorrente ofereceu mais dados'
        WHEN Motivo_Churn = 'Deceased' THEN 'Cliente falecido'
        WHEN Motivo_Churn = 'Don''t know' THEN 'N�o sabe'
        WHEN Motivo_Churn = 'Extra data charges' THEN 'Cobran�as extras por dados'
        WHEN Motivo_Churn = 'Lack of affordable download/upload speed' THEN 'Falta de velocidade acess�vel de download/upload'
        WHEN Motivo_Churn = 'Lack of self-service on Website' THEN 'Falta de autoatendimento no site'
        WHEN Motivo_Churn = 'Limited range of services' THEN 'Gama limitada de servi�os'
        WHEN Motivo_Churn = 'Long distance charges' THEN 'Cobran�as por chamadas de longa dist�ncia'
        WHEN Motivo_Churn = 'Moved' THEN 'Mudan�a de endere�o'
        WHEN Motivo_Churn = 'Network reliability' THEN 'Confiabilidade da rede'
        WHEN Motivo_Churn = 'Poor expertise of online support' THEN 'Suporte online com pouca experi�ncia'
        WHEN Motivo_Churn = 'Poor expertise of phone support' THEN 'Suporte telef�nico com pouca experi�ncia'
        WHEN Motivo_Churn = 'Price too high' THEN 'Pre�o muito alto'
        WHEN Motivo_Churn = 'Product dissatisfaction' THEN 'Insatisfa��o com o produto'
        WHEN Motivo_Churn = 'Service dissatisfaction' THEN 'Insatisfa��o com o servi�o'
        ELSE Motivo_Churn END;

--Adicionando valor maior na coluna
ALTER TABLE dbo.stg_Churn
ALTER COLUMN Motivo_Churn VARCHAR(100);

--Removendon nulos e inserindo os novos dados para a tabela �Prod�
SELECT 
    ID_Cliente,
    Genero,
    Idade,
    Casado,
    Estado,
    Numero_de_Indicacoes,
    Tempo_de_Contrato_Meses,
    ISNULL(Valor_de_Oferta, 'Nenhum') AS Valor_de_Oferta,
    Servico_Telefonico,
    ISNULL(Multiplas_Linhas, 'N�o') AS Multiplas_Linhas,
    Servico_de_Internet,
    ISNULL(Tipo_de_Internet, 'Nenhum') AS Tipo_de_Internet,
    ISNULL(Seguranca_Online, 'N�o') AS Seguranca_Online,
    ISNULL(Backup_Online, 'N�o') AS Backup_Online,
    ISNULL(Protecao_de_Dispositivo, 'N�o') AS Protecao_de_Dispositivo,
    ISNULL(Suporte_Premium, 'N�o') AS Suporte_Premium,
    ISNULL(TV_Stream, 'N�o') AS TV_Stream,
    ISNULL(Filmes_Stream, 'N�o') AS Filmes_Stream,
    ISNULL(Musica_Stream, 'N�o') AS Musica_Stream,
    ISNULL(Dados_Ilimitados, 'N�o') AS Dados_Ilimitados,
    Contrato,
    Fatura_Digital,
    Metodo_Pagamento,
    Valor_Mensal,
    Total_Cobrado,
    Total_Reembolsado,
    Total_Cobrancas_Extras_Dados,
    Total_Cobrancas_LD,
    Receita_Total,
    Status_Cliente,
    ISNULL(Categoria_Churn, 'Outros') AS Categoria_Churn,
    ISNULL(Motivo_Churn, 'Outros') AS Motivo_Churn

INTO [db_Churn].[dbo].[prod_Churn]
FROM [db_Churn].[dbo].[stg_Churn];


--Criando View para Machine Learn
Create View vw_ChurnData as
	select * from dbo.prod_Churn where Status_Cliente In ('Churn', 'Ativo')


Create View vw_JoinData as
	select * from dbo.prod_Churn where Status_Cliente = 'Ingressou'
