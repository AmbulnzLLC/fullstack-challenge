CREATE TABLE IF NOT EXISTS Pizzaria_pizzas(
    id VARCHAR(64) PRIMARY KEY,
    name VARCHAR(64) NOT NULL, 
    price FLOAT NOT NULL 
); 

CREATE TABLE IF NOT EXISTS Pizzaria_ingredientes(
    id VARCHAR(64) PRIMARY KEY,
    name VARCHAR(64) NOT NULL
); 
CREATE TABLE IF NOT EXISTS Pizzaria_ingredientes_pizza(
    id VARCHAR(64) PRIMARY KEY,
    id_pizza VARCHAR(64) NOT NULL,
    id_ingrediente VARCHAR(64) NOT NULL,
    FOREIGN KEY (id_pizza) REFERENCES Pizzaria_pizzas(id),
    FOREIGN KEY (id_ingrediente) REFERENCES Pizzaria_ingredientes(id)
); 