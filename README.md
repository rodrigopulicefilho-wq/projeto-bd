# Projeto de Banco de Dados - FlexEmpresta

## Estrutura das Tabelas (Modelo Físico)

### 1. Tabela: Clientes
| Campo | Tipo de Dado | Restrições |
| :--- | :--- | :--- |
| `id_cliente` | INT | Primary Key, Auto Increment |
| `nome` | VARCHAR(100) | Not Null |
| `cpf` | VARCHAR(14) | Not Null, Unique |
| `email` | VARCHAR(100) | Not Null, Unique |
| `telefone` | VARCHAR(20) | Null |
| `data_nascimento` | DATE | Not Null |

---

### 2. Tabela: Tipos de Empréstimo
| Campo | Tipo de Dado | Restrições |
| :--- | :--- | :--- |
| `id_tipo` | INT | Primary Key, Auto Increment |
| `nome_tipo` | VARCHAR(50) | Not Null |
| `taxa_juros_mensal` | DECIMAL(5,2) | Not Null |
| `descricao` | TEXT | Null |

---

### 3. Tabela: Empréstimos
| Campo | Tipo de Dado | Restrições |
| :--- | :--- | :--- |
| `id_emprestimo` | INT | Primary Key, Auto Increment |
| `id_cliente` | INT | Foreign Key (clientes) |
| `id_tipo` | INT | Foreign Key (tipos_emprestimo) |
| `valor_solicitado` | DECIMAL(10,2) | Not Null |
| `quantidade_parcelas` | INT | Not Null |
| `data_solicitacao` | DATE | Not Null |
| `status_emprestimo` | ENUM | Default: 'Análise' |

---

### 4. Tabela: Parcelas
| Campo | Tipo de Dado | Restrições |
| :--- | :--- | :--- |
| `id_parcela` | INT | Primary Key, Auto Increment |
| `id_emprestimo` | INT | Foreign Key (emprestimos) |
| `numero_parcela` | INT | Not Null |
| `valor_parcela` | DECIMAL(10,2) | Not Null |
| `data_vencimento` | DATE | Not Null |
| `status_pagamento` | ENUM | Default: 'Pendente' |
