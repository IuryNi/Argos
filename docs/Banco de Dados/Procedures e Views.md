# **Procedures e Views**



**--------- Visualização de relatos ---------**

Visualizar os relatos do usuário relator específico de acordo com o filtro passado. null=todos

Retorno: id\_relato, data, descritivo, status, caminho imagem, descritivo equipamento, identificacao do equipamento, categoria do relato, laboratório.



status, data, crescente ou decrescente.



Visualizar todos os relatos enviados ao usuários de nível superior. null=todos

Retorno: id\_relato, data, descritivo, status, urgência, caminho imagem, descritivo equipamento, identificação do equipamento, categoria do relato, laboratório, nome do relator, curso do relator.



status, urgência, data, laboratório, categoria, crescente ou decrescente.



**--------- Relatório ---------**

Visualizar um relatório mensal sobre os relatos do mês.
Retorno: id\_relato, descrição, data, status, urgência, caminho imagem, descritivo equipamento, identificação do equipamento, categoria do relato, laboratório, nome do relator, curso do relator.



Visualizar "estatísticas" do mês.
Retorno: quantidade de relatos no mês, laboratório com mais relatos, categoria com mais relatos, quantidade de relatos resolvidos.



**--------- Administrador ---------**

Visualizar todos os laboratórios.

Retorno: id e descritivo



Visualizar todos os equipamento por laboratório. null=todos

Retorno: id, descritivo, idenficacao



Visualizar todas as categorias.
Retorno: id e descritivo



Visualizar todos os níveis de usuário.
Retorno: id e descritivo



Visualizar todos os cursos.
Retorno: id e descritivo

Visualizar todos os usuários, exceto ele.
Retorno: id, nome, curso, email, nível de usuário

