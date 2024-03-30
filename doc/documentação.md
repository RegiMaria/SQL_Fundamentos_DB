<h3>Desafio de projeto - OFICINA</h3>

**Modelagem de esquema conceitual**

Ordem de serviço

Oficina

**Processo:**

Cliente procura oficina, usuário cadastra o cliente, veículo passa por diagnóstico para identificar o que precisa ser feito. Técnico responsável apresenta orçamento, cliente não autoriza execução de orçamento e encerra o serviço. Cliente autoriza a execução e do orçamento e usuário registra ordem de  serviço. O serviço é executado.

**Entidade e Atributos:**

- **Entidade Cliente:**
  - Atributos:
    - id_cliente (PK, NN, AI)
    - nome
    - cpf
    - telefone
    - veículo
    - placa
    - marca
    - modelo
- **Entidade Veículo:**
  - Atributos:
    - id_veiculo (PK, NN, AI)
    - marca
    - modelo
    - placa
    - cor
    - ano
    - motor
    - tipo_transmissao
    - tipo_combustível
    - observações
    - data
    - id_cliente (FK)
- **Entidade Orçamento:**
  - Atributos:
    - id_orcamento (PK, NN, AI)
    - solicitante
    - data
    - validade
    - veiculo
    - descrição
    - tecnico_responsavel
    - mao_de_obra
    - id_cliente (FK)
    - id_veiculo (FK)
    - id_tecnico(FK)
- **Entidade Ordem de Serviço:**
  - Atributos:
    - idordem_servico (PK, NN, AI)
    - solicitante
    - data_entrada
    - data_entrega
    - descrição
    - materiais
    - mao_de_obra
    - id_cliente (FK)
    - id_veiculo (FK)
    - id_tecnico (FK)
    - status
    - valor
- **Entidade Produto:**
  - Atributos:
    - idproduto (PK, NN, AI)
    - nome_peça
    - código_peça
    - tipo
    - fornecedor
    - preço_unitário
    - quantidade
    - localização_estoque
- **Tabela Orcamento_Produto:**
  - Atributos:
    - idorcamento_produto (PK, NN, AI)
    - quantidade
    - preco_unitario
    - desconto
    - total
    - data
    - observações
    - id_orcamento (FK)
    - id_produto (FK)

- **Responsavel_tecnico:**

  - Atributos: 

    - idtecnico (PK, NN, AI)

    - nome

    - cpf

    - telefone

    - especialidade

    - data_contratacao

    - salario

    - status

      

