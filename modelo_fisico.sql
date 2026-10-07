-- Criação do banco de dados FlexEmpresta
CREATE DATABASE IF NOT EXISTS flex_empresta;
USE flex_empresta;

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL
);

-- Tabela de Tipos de Empréstimo
CREATE TABLE IF NOT EXISTS tipos_emprestimo (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nome_tipo VARCHAR(50) NOT NULL,
    taxa_juros_mensal DECIMAL(5, 2) NOT NULL,
    descricao TEXT
);

-- Tabela de Contratos de Empréstimo
CREATE TABLE IF NOT EXISTS emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_tipo INT NOT NULL,
    valor_solicitado DECIMAL(10, 2) NOT NULL,
    quantidade_parcelas INT NOT NULL,
    data_solicitacao DATE NOT NULL,
    status_emprestimo ENUM('Análise', 'Aprovado', 'Recusado', 'Finalizado') DEFAULT 'Análise',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_tipo) REFERENCES tipos_emprestimo(id_tipo)
);

-- Tabela de Parcelas
CREATE TABLE IF NOT EXISTS parcelas (
    id_parcela INT AUTO_INCREMENT PRIMARY KEY,
    id_emprestimo INT NOT NULL,
    numero_parcela INT NOT NULL,
    valor_parcela DECIMAL(10, 2) NOT NULL,
    data_vencimento DATE NOT NULL,
    status_pagamento ENUM('Pendente', 'Pago', 'Atrasado') DEFAULT 'Pendente',
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimos(id_emprestimo)
);
