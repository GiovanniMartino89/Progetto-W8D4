-- Progetto W8D4 Giovanni M. Martino, DAPT0326IT

-- Task 2. DDL, Creazione delle tabelle 

CREATE DATABASE ToysGroup; -- Creo il Database ToysGroup con relativo comando
USE ToysGroup; -- E subito lo rendo operativo

-- Tabella dimensione: Product
-- PK: ProductID, NOT NULL su tutti gli attributi obbligatori

CREATE TABLE Product (
    ProductID   VARCHAR(20)     NOT NULL, 
    ProductName VARCHAR(100)    NOT NULL,
    Category    VARCHAR(50)     NOT NULL,
    Price       DECIMAL(10,2)   NOT NULL,
    PRIMARY KEY (ProductID)
);

-- Tabella dimensione: Region
-- PK: RegionID, NOT NULL su tutti gli attributti obbligatori

CREATE TABLE Region (
    RegionID    VARCHAR(20)     NOT NULL,
    State       VARCHAR(100)    NOT NULL,
    Area        VARCHAR(50)     NOT NULL,
    PRIMARY KEY (RegionID)
);

-- Tabella dei fatti: Sales
-- PK: SalesID (INT, auto-incrementale)
-- FK verso Product e verso Region, stesso tipo delle rispettive PK

CREATE TABLE Sales (
    SalesID     INT             NOT NULL AUTO_INCREMENT,
    ProductID   VARCHAR(20)     NOT NULL,
    RegionID    VARCHAR(20)     NOT NULL,
    Quantity    INT             NOT NULL,
    SaleDate    DATE            NOT NULL,
    PRIMARY KEY (SalesID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

-- Task 3. Popolamento Dati 
-- Consegna: popolare le tabelle con dati a scelta

-- 3.1 Inserire in Product almeno 4 prodotti distribuiti su almeno 2 caregorie differenti
INSERT INTO Product (ProductID, ProductName, Category, Price) VALUES -- inserisco 25 prodotti divisi tra bikes, dolls, puzzle, cars
('Bikes-100', 'Mountain Bike Explorer', 'Bikes', 350.00),
('Bikes-200', 'Road Bike Speedster', 'Bikes', 420.00),
('Bikes-300', 'Kids Bike Rider', 'Bikes', 150.00),
('Bikes-400', 'BMX Trick Star', 'Bikes', 280.00),
('Bikes-500', 'Electric Bike Volt', 'Bikes', 900.00),
('Dolls-100', 'Fashion Doll Emma', 'Dolls', 25.00),
('Dolls-200', 'Baby Doll Sophie', 'Dolls', 18.00),
('Dolls-300', 'Princess Doll Aurora', 'Dolls', 35.00),
('Dolls-400', 'Doll House Deluxe', 'Dolls', 60.00),
('Dolls-500', 'Rag Doll Classic', 'Dolls', 15.00),
('Puzzle-100', 'Jigsaw 500 Pieces', 'Puzzles', 20.00),
('Puzzle-200', 'Jigsaw 1000 Pieces', 'Puzzles', 30.00),
('Puzzle-300', '3D Puzzle Castle', 'Puzzles', 45.00),
('Puzzle-400', 'Wooden Puzzle Farm', 'Puzzles', 22.00),
('Puzzle-500', 'Brain Teaser Cube', 'Puzzles', 12.00),
('Cars-100', 'RC Racing Car', 'Cars', 55.00),
('Cars-200', 'Monster Truck XL', 'Cars', 80.00),
('Cars-300', 'Model Car Vintage', 'Cars', 40.00),
('Cars-400', 'RC Drift Car', 'Cars', 65.00),
('Cars-500', 'Formula Race Car', 'Cars', 95.00),
('Bikes-600', 'Folding Bike Compact', 'Bikes', 220.00),
('Bikes-700', 'Balance Bike Toddler', 'Bikes', 90.00),
('Dolls-600', 'Interactive Doll Robo', 'Dolls', 75.00),
('Puzzle-600', 'Puzzle Mat Deluxe', 'Puzzles', 28.00),
('Cars-600', 'Vintage Train Set', 'Cars', 50.00);

-- 3.2 Inserire in Region almeno 3 Stati distribuiti su almeno 2 regioni di vendita differenti
INSERT INTO Region (RegionID, State, Area) VALUES -- Inserisco 10 Stati in 3 aree geografiche differenti
('DE', 'Germany', 'WestEurope'),
('FR', 'France', 'WestEurope'),
('IT', 'Italy', 'WestEurope'),
('ES', 'Spain', 'WestEurope'),
('PL', 'Poland', 'EastEurope'),
('CZ', 'Czechia', 'EastEurope'),
('HU', 'Hungary', 'EastEurope'),
('US', 'United States', 'NorthAmerica'),
('CA', 'Canada', 'NorthAmerica'),
('MX', 'Mexico', 'NorthAmerica');

-- 3.3 Inserire in Sales almeno 10 transazioni distribuite su più anni, per poter confrontare periodi diversi
INSERT INTO Sales (ProductID, RegionID, Quantity, SaleDate) VALUES -- Inserisco 25 prodotti in diversi anni
('Bikes-100', 'DE', 12, '2022-03-15'),
('Bikes-200', 'FR', 8,  '2022-06-20'),
('Dolls-100', 'US', 25, '2022-11-05'),
('Puzzle-100', 'IT', 15, '2022-12-01'),
('Cars-100', 'PL', 10, '2023-01-18'),
('Bikes-300', 'ES', 6,  '2023-02-27'),
('Dolls-200', 'CA', 20, '2023-04-10'),
('Puzzle-200', 'DE', 9,  '2023-05-22'),
('Cars-200', 'US', 14, '2023-07-08'),
('Bikes-400', 'CZ', 5,  '2023-08-19'),
('Dolls-300', 'FR', 18, '2023-09-30'),
('Puzzle-300', 'HU', 7,  '2023-10-14'),
('Cars-300', 'MX', 11, '2023-11-25'),
('Bikes-500', 'IT', 4,  '2024-01-09'),
('Dolls-400', 'DE', 22, '2024-02-16'),
('Puzzle-400', 'US', 13, '2024-03-21'),
('Cars-400', 'CA', 9,  '2024-04-30'),
('Dolls-500', 'PL', 19, '2024-07-24'),
('Puzzle-500', 'ES', 8,  '2024-09-02'),
('Cars-500', 'US', 21, '2024-10-17');

-- Verifico che, dopo l'INSERT, come le tabelle sono effettivamente popolate
SELECT * FROM Product;
SELECT * FROM Region;
SELECT * FROM Sales;

-- Verifico se, dopo l'INSERT, il numero totale delle righe è corretto
SELECT COUNT(*) FROM Product; 
SELECT COUNT(*) FROM Region; 
SELECT COUNT(*) FROM Sales;

-- Task 4a. Integrità e Join
-- Consegna: verificare l'unicità delle chiavi primarie e costruire l'elenco delle transazioni con INNER JOIN

-- 4a.1 Per ciascuna tabella scrivere una query che verifichi l'univocità delle chiavi primarie

SELECT COUNT(*) AS totale, -- Unicità per Product
	COUNT(DISTINCT ProductID) AS distinti 
	FROM Product;

SELECT COUNT(*) AS totale, -- Unicità per Region
	COUNT(DISTINCT RegionID) AS distinti 
	FROM Region;

SELECT COUNT(*) AS totale, -- Unicità per Sales
	COUNT(DISTINCT SalesID) AS distinti 
	FROM Sales; -- il risultato per tutte e 3 è totale uguale a distinti, quindi le PK sono univoche
    
-- 4a.2 Con INNER JOIN tra Sales, Product e Region, esporre codice prodotto, categoria, stato, regione di vendita e data di ogni transazione

SELECT --
    p.ProductID,
    p.Category,
    r.State,
    r.Area,
    s.SaleDate
FROM Sales s -- Estraggo dalla tabella dei fatti, Sales 
INNER JOIN Product p ON s.ProductID = p.ProductID -- colleghiamo sales con product (FK)
INNER JOIN Region r ON s.RegionID = r.RegionID; -- colleghiamo sales con region altra FK

-- 4a.3 Aggiungere una colonna booleana. True se sono passati più di 180 giorni, False altrimenti

SELECT
    p.ProductID,
    p.Category,
    r.State,
    r.Area,
    s.SaleDate,
    (DATEDIFF(CURDATE(), s.SaleDate) > 180) AS PiuDi180Giorni -- uso DATEDIFF su Curdate e le date di vendita
FROM Sales s
INNER JOIN Product p ON s.ProductID = p.ProductID -- stessa query di prima, aggiunta solo DATEDIFF su
INNER JOIN Region r ON s.RegionID = r.RegionID;

-- Task 4b. Aggregazioni e Raggruppamenti
-- Consegna: calcolare il fatturato aggregato per diverse chiavi di analisi con GROUP BY e HAVING

-- 4b.1 Fatturato totale per prodotto e per anno (SUM(SalesAmount)) raggruppato per ProducID e SalesDate

SELECT
    p.ProductID,
    YEAR(s.SaleDate) AS Anno,
    SUM(s.Quantity * p.Price) AS SalesAmount -- salesamount è SUM tra quantità e prezzo
FROM Sales s
INNER JOIN Product p ON s.ProductID = p.ProductID -- referenzio tra sales e product tramite product it
GROUP BY p.ProductID, -- faccio il group by con chi non è in una funzione, ProductID
YEAR(s.SaleDate) -- raggruppo per tutte le vendite di un solo anno con YEAR
HAVING SalesAmount > 0; -- filtro dopo l'aggregazione

-- 4b.2 Fatturato totale per anno e per stato, ordinato per data e fatturato decrescente

SELECT -- stesso schema della query precedente fino all'INNER JOIN
    r.State,
    YEAR(s.SaleDate) AS Anno,
    SUM(s.Quantity * p.Price) AS SalesAmount
FROM Sales s
INNER JOIN Product p ON s.ProductID = p.ProductID -- product su sales e product
INNER JOIN Region r ON s.RegionID = r.RegionID -- region su sales e region
GROUP BY r.State, -- state non presente in funzione, quindi group by
YEAR(s.SaleDate)
HAVING SalesAmount > 0
ORDER BY Anno, SalesAmount DESC; -- con ORDER BY ordino per data e DESC per farla decrescente 

-- 4b.3 Categoria di prodotto più richiesta dal mercato, misurata come quantità totala venduta

SELECT
    p.Category,
    SUM(s.Quantity) AS QuantitaTotale
FROM Sales s
INNER JOIN Product p ON s.ProductID = p.ProductID -- inner join come sopra sui product tra sales e product
GROUP BY p.Category -- su category, non presente in funzioni
HAVING QuantitaTotale > 0
ORDER BY QuantitaTotale DESC
LIMIT 1; -- mi mostra solo la prima riga del risultato

-- Task 4c. Subquery e CTE
-- Consegna: esporre i prodotti venduti con quantità totale superiore alla media di vendita dell'ultimo anno censito, in 2 modi equivalenti

-- 4c.1 Calcolare con una subquery la quantità media venduta per prodotto nell'ultimo anno censito
SELECT AVG(TotaleProdotto) AS MediaVendite
FROM (
    SELECT SUM(Quantity) AS TotaleProdotto
    FROM Sales
    WHERE YEAR(SaleDate) = (SELECT MAX(YEAR(SaleDate)) FROM Sales)
    GROUP BY ProductID
) AS Sub; -- la Sub è fatta dal totale delle quantità da Sales, con where gli ho detto di prendere l'anno più recente

-- 4c.2 Usare la subquery del punto 1 in una condizione WHERE per filtrare i prodotti sopra media

SELECT -- mi prendo product e il totale venduto che calcolo giù
    ProductID,
    TotaleVenduto
FROM (
    SELECT
        ProductID,
        SUM(Quantity) AS TotaleVenduto
    FROM Sales
    WHERE YEAR(SaleDate) = (SELECT MAX(YEAR(SaleDate)) FROM Sales)
    GROUP BY ProductID
) AS Totali -- stesso schema di quella quella sopra, solo che faccio un select da product id
WHERE TotaleVenduto > (
    SELECT AVG(TotaleProdotto)
    FROM (
        SELECT SUM(Quantity) AS TotaleProdotto
        FROM Sales
        WHERE YEAR(SaleDate) = (SELECT MAX(YEAR(SaleDate)) FROM Sales)
        GROUP BY ProductID
    ) AS Sub -- subquery del punto uno inserita in Where, filtro quelli con un totale maggiore della media
);

-- 4c.3 Riscrivere la stessa query con una CTE che isola il calcolo della media, richiamata dalla query principale

WITH TotaliPerProdotto AS (
    SELECT
        ProductID,
        SUM(Quantity) AS TotaleVenduto
    FROM Sales
    WHERE YEAR(SaleDate) = (SELECT MAX(YEAR(SaleDate)) FROM Sales)
    GROUP BY ProductID
) -- la cte ricalca gli schemi precedenti, la denomino come sopra
SELECT
    ProductID,
    TotaleVenduto
FROM TotaliPerProdotto
WHERE TotaleVenduto > (SELECT AVG(TotaleVenduto) FROM TotaliPerProdotto); -- la query con la cte, stesso risultato di sopra

-- Task 4d. Windows Function
-- Consegna: arricchire il result set delle transazioni con una classifica per totale progressivo, senza perdere dettaglio riga

-- 4c.1 Assegnare a ogni prodotto una posizione in classifica per fatturato totale, all'interno della propria categoria

SELECT
    ProductID,
    Category,
    FatturatoTotaleProdotto,
    RANK() OVER (PARTITION BY Category ORDER BY FatturatoTotaleProdotto DESC) AS PosizioneInCategoria
FROM ( -- function windows con rank, assegno, con partition divido in base alla categoria con order li misuro in base al fatturato 
    SELECT
        p.ProductID,
        p.Category,
        SUM(s.Quantity * p.Price) AS FatturatoTotaleProdotto -- computo del fatturato totale
    FROM Sales s
    INNER JOIN Product p ON s.ProductID = p.ProductID -- inner su product in sales e in product
    GROUP BY p.ProductID, p.Category -- unici non usati nella funzione
) AS Sub;

-- 4c.2 Calcolare, per ogni transazione, il totale progressivo del fatturato della regione fino a quella data

SELECT
    s.SalesID,
    s.RegionID,
    s.SaleDate,
    (s.Quantity * p.Price) AS Fatturato,
    SUM(s.Quantity * p.Price) OVER ( -- prima ci calcoliamo la somma per il fatturato
        PARTITION BY s.RegionID
        ORDER BY s.SaleDate, s.SalesID
    ) AS TotaleProgressivoRegione -- poi applichiamo la wf sulla somma
FROM Sales s
INNER JOIN Product p ON s.ProductID = p.ProductID;

-- 4c.3 Confrontare il fatturato di ogni transazione con quello della transazione precedente della stessa regione

WITH VenditeNumerate AS ( -- ho fatto una cte in cui ho lanciato una windows function sul fatturato per fare una numerazione 
    SELECT
        s.SalesID,
        s.RegionID,
        s.SaleDate,
        (s.Quantity * p.Price) AS Fatturato,
        ROW_NUMBER() OVER (
            PARTITION BY s.RegionID 
            ORDER BY s.SaleDate, s.SalesID
        ) AS RN
    FROM Sales s
    INNER JOIN Product p ON s.ProductID = p.ProductID
)
SELECT -- e poi ho scritto la query normale richiamando la cte. I risultati li da ma non penso sia il modo migliore per farla, ecco. 
    c.SalesID,
    c.RegionID,
    c.SaleDate,
    c.Fatturato,
    p.Fatturato AS FatturatoPrecedente,
    (c.Fatturato - p.Fatturato) AS Differenza
FROM VenditeNumerate c
LEFT JOIN VenditeNumerate p 
    ON c.RegionID = p.RegionID AND p.RN = c.RN - 1; -- ragionamento pratico, risultato corrente meno quello precedente, per questo mi puzza

-- Task 4e • Prodotti invenduti e VIEW
-- Consegna: individuare i prodotti mai venduti e creare due viste che espongano informazioni pronte per il reporting.

-- 4e.1 Individuare i prodotti invenduti con un primo approccio a scelta (es. sottrazione o confronto di insiemi)

SELECT p.ProductID, p.ProductName, p.Category
	FROM Product p
	LEFT JOIN Sales s ON p.ProductID = s.ProductID
	WHERE s.SalesID IS NULL; -- la più pratica, se trova product in sales è venduto, altrimenti con where cerchiamo quelli invenduto 

-- 4e.2 Risolvere la stessa domanda del punto 1 con un secondo approccio diverso dal primo.

SELECT p.ProductID, p.ProductName, p.Category
	FROM Product p
	WHERE NOT EXISTS (
    SELECT 1
    FROM Sales s
    WHERE s.ProductID = p.ProductID -- Alternativamente, con NOT EXISTS si verifica solo se non trova prodotti in sales
);

-- 4e.3 Creare una vista sui prodotti che esponga una versione denormalizzata con codice prodotto, nome prodotto e nome categoria.

CREATE VIEW vista_prodotti_categoria AS -- diciamo al db di memorizzare questo nome
SELECT ProductID, ProductName, Category -- popolata con il select da produc e category selezionata da product
FROM Product;

-- 4e.4 Creare una vista per le informazioni geografiche, utile a chi analizza le vendite per area.

CREATE VIEW vista_regioni_geografia AS  -- diciamo al db di mememorizzare questo nome 
SELECT RegionID, State, Area -- popolata per region, state e area selezionata da region ovviamente 
FROM Region;

-- Interrogazione delle viste per verificare. 
SELECT * FROM vista_prodotti_categoria;
SELECT * FROM vista_regioni_geografia;

-- Governance e Privacy applicata (Ultimo esercizio)

-- 1. Caso 1, Vista Pubblica

CREATE VIEW vw_prodotti_rivenditori AS
SELECT ProductID, ProductName, Category
FROM Product;

-- 2. 

CREATE TABLE SupplierContact (
    SupplierID INT,
    Phone VARCHAR(20)
); -- accessibile solo al reparto acquisti

-- 3. Vista commerciale 

CREATE VIEW vw_sales_margine AS
SELECT SalesID, SalesAmount
FROM Sales;

CREATE VIEW vw_sales_margine_finance AS
SELECT SalesID, SalesAmount, PurchaseCost, Margin
FROM Sales; -- il margine resta visibile solo tramite una vista separata, accessibile esclusivamente al reparto Finance

-- 4. Log di reporting

CREATE TABLE ReportAccessLog (
    UserID      INT,
    QueryText   TEXT,
    AccessDate  DATETIME,
    ExpiryDate  DATETIME  -- data di scadenza del record 
);
DELETE FROM ReportAccessLog WHERE ExpiryDate < NOW(); -- cancellazione dei record scaduti

-- FINE