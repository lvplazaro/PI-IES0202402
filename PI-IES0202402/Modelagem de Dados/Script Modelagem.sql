CREATE DATABASE Recomentacao;
CREATE TABLE Cliente (
    ID_Cliente INTEGER PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

-- Tabela Restaurante
CREATE TABLE Restaurante (
    idRestaurante INTEGER PRIMARY KEY,
    HistoricoAvaliacao_idHistoricoAvaliacao INTEGER,
    Preferencia_Comida_idPreferencia_Comida INTEGER,
    Favorito_idFavorito INTEGER,
    Capacidade INT,
    Distancia GEOMETRY,
    Telefone VARCHAR(20),
    NomeSocial VARCHAR(100),
    FOREIGN KEY (Favorito_idFavorito) REFERENCES Favorito(idFavorito),
    FOREIGN KEY (Preferencia_Comida_idPreferencia_Comida) REFERENCES Preferencia_Comida(idPreferencia_Comida),
    FOREIGN KEY (HistoricoAvaliacao_idHistoricoAvaliacao) REFERENCES HistoricoAvaliacao(idHistoricoAvaliacao)
);

-- Tabela Categoria
CREATE TABLE Categoria (
    idCategoria INTEGER PRIMARY KEY,
    Restaurante_idRestaurante INTEGER,
    NomeCategoria VARCHAR(100),
    FOREIGN KEY (Restaurante_idRestaurante) REFERENCES Restaurante(idRestaurante)
);

-- Tabela Forma_Pagamento
CREATE TABLE Forma_Pagamento (
    idForma_Pagamento INTEGER PRIMARY KEY,
    Restaurante_idRestaurante INTEGER,
    NomeFormaPagamento VARCHAR(100),
    FOREIGN KEY (Restaurante_idRestaurante) REFERENCES Restaurante(idRestaurante)
);

-- Tabela Cardapio
CREATE TABLE Cardapio (
    idCardapio INTEGER PRIMARY KEY,
    Restaurante_idRestaurante INTEGER,
    Preco DOUBLE,
    CategoriaCardapio VARCHAR(100),
    Item_Descricao VARCHAR(255),
    Item_Nome VARCHAR(100),
    FOREIGN KEY (Restaurante_idRestaurante) REFERENCES Restaurante(idRestaurante)
);

-- Tabela Busca
CREATE TABLE Busca (
    idBusca INTEGER PRIMARY KEY,
    Cliente_ID_Cliente INTEGER,
    DataHora DATETIME,
    Termo_Busca VARCHAR(255),
    FOREIGN KEY (Cliente_ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Tabela Preferencia_Comida
CREATE TABLE Preferencia_Comida (
    idPreferencia_Comida INTEGER PRIMARY KEY,
    Busca_idBusca INTEGER,
    Preferencia_Comida VARCHAR(100),
    Preferencia_Bebida VARCHAR(100),
    Preferencia_Momento VARCHAR(100),
    FOREIGN KEY (Busca_idBusca) REFERENCES Busca(idBusca)
);

-- Tabela Avaliacao
CREATE TABLE Avaliacao (
    idAvaliacao INTEGER PRIMARY KEY,
    Cliente_ID_Cliente INTEGER,
    DataAvaliacao DATETIME,
    Nota DOUBLE,
    Comentario VARCHAR(255),
    FOREIGN KEY (Cliente_ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Tabela HistoricoAvaliacao
CREATE TABLE HistoricoAvaliacao (
    idHistoricoAvaliacao INTEGER PRIMARY KEY,
    Avaliacao_idAvaliacao INTEGER,
    FOREIGN KEY (Avaliacao_idAvaliacao) REFERENCES Avaliacao(idAvaliacao)
);

-- Tabela Favorito
CREATE TABLE Favorito (
    idFavorito INTEGER PRIMARY KEY,
    Cliente_ID_Cliente INTEGER,
    FOREIGN KEY (Cliente_ID_Cliente) REFERENCES Cliente(ID_Cliente)
);
