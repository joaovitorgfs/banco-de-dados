#Recupere o nome e data de nascimento dos funcionários com salario entre 2000 e 3000 mil reais.
Ordene os dadospela idade dos funcionários em ordem decrescente SELECT F.NOM_FUNC, F.DTA_NASCIMENTO
FROM FUNCIONARIO AS F
WHERE F.VAL_SALARIO BETWEEN 2000 AND 3000 ORDER BY DTA_NASCIMENTO DESC;

#Recupere o nome, data de nascimento dos dependentes do sexo feminimo nascidos após o dia 01/01/2000
SELECT D.NOM_DEPENDENTE, D.DTA_NASCIMENTO FROM DEPENDENTE AS D
WHERE DES_SEXO = 'F' AND DTA_NASCIMENTO >= '2000-01-01';

#Recupere os pedidos realizados neste ano ou cujo valor total seja inferior a 2000 mil reais ordenados pelo código do pedido.
SELECT * FROM PEDIDO
WHERE VAL_TOTAL_PEDIDO <= 2000 ORDER BY COD_PEDIDO;

#Recupere o nome e data de Admissão dos funcionários admitidos entre os anos 2000 e 2020 que não tenham supervisores. Ordene os dados para mostrar primeiro os funcionários com mais tempo de casa.
SELECT F.NOM_FUNC, F.DTA_ADMISSAO FROM FUNCIONARIO AS F
WHERE DTA_ADMISSAO BETWEEN '2000-01-01' AND '2020-12-31' AND COD_FUNC_SUPERVISOR IS NULL;

#Mostre os projetos não encerrados que tenham coordenadores.
SELECT * FROM PROJETO
WHERE DTA_FIM IS NULL AND COD_FUNC_COORDENADOR IS NOT NULL;

#Mostre os dependentes que nasceram após o ano de 2000 que tenham silva no nome. Mostre os dependentes com maior idade primeiro.
SELECT * FROM DEPENDENTE
WHERE DTA_NASCIMENTO >= '2000-01-01' AND NOM_DEPENDENTE LIKE '%SILVA' ORDER BY DTA_NASCIMENTO DESC;

#Recupere os pedidos feitos há menos de cinco anos. SELECT * FROM PEDIDO
WHERE DTA_PEDIDO > '01-01-2017';

#Recupere os funcionários admitidos há mais de cinco anos que não tenha supervisor e cujo salário esteja entre 2000 e 5000 mil reais. Ordene os dados mostrando primeiro os funcionários com menor idade.
SELECT * FROM FUNCIONARIO
WHERE DTA_ADMISSAO < '2017-12-31' AND COD_FUNC_SUPERVISOR IS NULL AND VAL_SALARIO BETWEEN 2000 AND 5000
ORDER BY DTA_NASCIMENTO;
 
#Recupere os dependentes que terão 18 anos ou mais após o ano que vem.
SELECT * FROM DEPENDENTE
WHERE (DATEDIFF(Now(), Dta_Nascimento) / 365 + 1) >= 18;

#Mostre o nome dos funcionários no cargo 1 que teria salário acima de 2000 reais caso seu salário atual fosse reajustado em 10 %. Exiba também qual seria o salário destes funcionários caso o salario fosse reajustado em 10% SELECT NOM_FUNC, VAL_SALARIO * 1.10
FROM FUNCIONARIO
WHERE COD_CARGO = 1 AND VAL_SALARIO * 1.10 >= 2000;
