CREATE TYPE Categorie AS ENUM('electronique','plastique', 'textile', 'bois');
CREATE TYPE ClientType AS ENUM('ancientClient','moteurDeRecherche', 'reseauxSociaux', 'partenariats');

CREATE TABLE PRODUIT(

	IDProduit INT PRIMARY KEY,
	nom Varchar,
	IAN INT,
	prix FLOAT,
	fabrCiquant Varchar,
	dateEntree Date,
	categorie Categorie

);

CREATE TABLE ADRESSE_POSTALE(

	IDAdressePostale INT PRIMARY KEY,
	numero INT,
	nomRue Varchar,
	codePostal INT,
	commune Varchar,
	pays Varchar
);

CREATE TABLE CLIENT(
	
	IDClient INT PRIMARY KEY,
	nom Varchar,
	mdp Varchar,
	adresseElectronique Varchar,
	clientType ClientType,
	IDAdressePostale INT REFERENCES ADRESSE_POSTALE(IDAdressePostale)
);

CREATE TABLE AVIS(
	
	IDAvis INT PRIMARY KEY,
	note INT,
	commentaire Varchar,
	dateRedaction DATE
);

CREATE TABLE COMMANDE(
	
	IDClient INT REFERENCES CLIENT(IDClient),
	IDAvis INT REFERENCES AVIS(IDAvis),
	IDCommande INT PRIMARY KEY,
	quantité INT,
	remise FLOAT,
	sousTotal FLOAT,
	montantTaxe FLOAT,
	montantTotal FLOAT,
	dateValidation Date

);

Create TABLE COMMANDE_PRODUIT(

	IDProduit INT REFERENCES PRODUIT(IDProduit),
	IDCommande INT REFERENCES COMMANDE(IDCommande)

);
