-- Tabela de Parâmetros de Multa (deve vir primeiro por questões de referência)
CREATE TABLE PARAMETRO_MULTA 
( 
    id_parametro INT PRIMARY KEY AUTO_INCREMENT,  
    valor_por_dia DECIMAL(10,2) NOT NULL,  
    data_inicio_vigencia DATE NOT NULL,  
    data_fim_vigencia DATE,  
    descricao VARCHAR(255)
);

-- Tabela de Autor
CREATE TABLE AUTOR 
( 
    id_autor INT PRIMARY KEY AUTO_INCREMENT,  
    nome VARCHAR(255) NOT NULL,  
    nacionalidade VARCHAR(100) NOT NULL,  
    data_nascimento DATE NOT NULL
);

-- Tabela de Estoque (deve vir antes de OBRA)
CREATE TABLE ESTOQUE_OBRA 
( 
    id_estoque_obra INT PRIMARY KEY AUTO_INCREMENT,  
    quantidade_reservada INT DEFAULT 0,  
    quantidade_emprestada INT DEFAULT 0,  
    quantidade_total INT DEFAULT 0,  
    quantidade_disponivel INT DEFAULT 0
);

-- Tabela de Obra
CREATE TABLE OBRA 
( 
    id_obra INT PRIMARY KEY AUTO_INCREMENT,  
    isbn VARCHAR(20) NOT NULL,  
    titulo VARCHAR(255) NOT NULL,  
    edicao INT NOT NULL,  
    ano_publicacao YEAR NOT NULL,  
    id_estoque_obra INT,  
    UNIQUE (isbn),
    FOREIGN KEY (id_estoque_obra) REFERENCES ESTOQUE_OBRA(id_estoque_obra)
);

-- Tabela de Exemplar
CREATE TABLE EXEMPLAR 
( 
    id_exemplar INT PRIMARY KEY AUTO_INCREMENT,  
    codigo_patrimonio VARCHAR(50) UNIQUE NOT NULL,
    status ENUM('Disponível', 'Emprestado', 'Reservado', 'Danificado', 'Extraviado') NOT NULL,  
    data_aquisicao DATE NOT NULL,  
    localizacao VARCHAR(100) NOT NULL,  
    id_obra INT NOT NULL,  
    FOREIGN KEY (id_obra) REFERENCES OBRA(id_obra)
);

-- Tabela Base de Usuários
CREATE TABLE USUARIO 
( 
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,  
    matricula VARCHAR(20) UNIQUE NOT NULL,  
    email_institucional VARCHAR(255) UNIQUE NOT NULL,  
    senha_hash VARCHAR(255) NOT NULL,  
    nome_completo VARCHAR(255) NOT NULL,  
    tipo_usuario ENUM('aluno', 'professor', 'administrador') NOT NULL,  
    status ENUM('ativo', 'inativo', 'bloqueado') NOT NULL,  
    telefone VARCHAR(20),  
    data_nascimento DATE NOT NULL,  
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Empréstimo
CREATE TABLE EMPRESTIMO 
( 
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,  
    data_emprestimo DATE NOT NULL,  
    data_prevista_devolucao DATE NOT NULL,  
    data_devolucao DATE,  
    status ENUM('ativo', 'concluído', 'atrasado') NOT NULL,  
    id_exemplar INT NOT NULL,  
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_exemplar) REFERENCES EXEMPLAR(id_exemplar),
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

-- Tabela de Multa
CREATE TABLE MULTA 
( 
    id_multa INT PRIMARY KEY AUTO_INCREMENT,  
    id_emprestimo INT NOT NULL,
    valor_original DECIMAL(10,2) NOT NULL,  
    valor_atual DECIMAL(10,2) NOT NULL,  
    data_criacao DATE NOT NULL,  
    data_pagamento DATE,  
    status ENUM('pendente', 'paga', 'cancelada') NOT NULL,  
    id_parametro_multa INT,
    FOREIGN KEY (id_emprestimo) REFERENCES EMPRESTIMO(id_emprestimo),
    FOREIGN KEY (id_parametro_multa) REFERENCES PARAMETRO_MULTA(id_parametro)
);

-- Tabela de Reserva
CREATE TABLE RESERVA 
( 
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,  
    id_usuario INT NOT NULL,  
    id_obra INT NOT NULL,  
    data_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    status ENUM('ativa', 'cancelada', 'expirada', 'concluída') NOT NULL,  
    data_expiracao DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_obra) REFERENCES OBRA(id_obra)
);

-- Tabelas Especializadas de Usuários
CREATE TABLE ALUNO 
( 
    id_usuario INT PRIMARY KEY,  
    curso VARCHAR(100) NOT NULL,  
    semestre INT NOT NULL,  
    turno ENUM('matutino', 'vespertino', 'noturno'),  
    data_ingresso DATE,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE PROFESSOR 
( 
    id_usuario INT PRIMARY KEY,  
    departamento VARCHAR(100) NOT NULL,  
    titulacao ENUM('graduacao', 'especializacao', 'mestrado', 'doutorado') NOT NULL,  
    regime_trabalho ENUM('20h', '40h', 'DE') NOT NULL,  
    data_contratacao DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE ADMINISTRADOR 
( 
    id_usuario INT PRIMARY KEY,  
    setor VARCHAR(100),  
    nivel_acesso ENUM('operador', 'supervisor', 'gerente') NOT NULL,  
    funcao VARCHAR(100),  
    data_admissao DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

-- Tabela de Relacionamento Obra-Autor
CREATE TABLE OBRA_AUTOR 
( 
    id_obra INT NOT NULL,  
    id_autor INT NOT NULL,  
    PRIMARY KEY (id_obra, id_autor),
    FOREIGN KEY (id_obra) REFERENCES OBRA(id_obra),
    FOREIGN KEY (id_autor) REFERENCES AUTOR(id_autor)
);