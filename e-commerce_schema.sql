CREATE TABLE PRODUIT(
	
	IDProduit INT,
	nom Varchar,
	IAN INT,
	prix FLOAT,
	fabriquant Varchar,
	dateEntree Date,
	categorie ENUM('electronique','plastique', 'textile', 'bois')
	PrimaryKey(IDProduit)
	
);


CREATE TABLE ADRESSE_POSTALE(

	IDAdressePostale INT,
	numero INT,
	nomRue Varchar,
	codePostal INT,
	commune Varchar,
	pays Varchar

	PrimaryKey(IDAdressePostale)
);

CREATE TABLE CLIENT(
	
	IDClient INT,
	nom Varchar,
	mdp Varchar,
	adresseElectronique Varchar,
	categorie ENUM('ancientClient','moteurDeRecherche', 'reseauxSociaux', 'partenariats')
	IDAdressePostale INT REFERENCES ADRESSE_POSTALE(IDAdressePostale)

	PrimaryKey(IDClient)

);

CREATE TABLE AVIS(
	
	IDAvis INT,
	note INT,
	commentaire Varchar,
	dateRedaction DATE,

	PrimaryKey(IDAvis)

);

CREATE TABLE COMMANDE(
	
	IDClient INT REFERENCES CLIENT(IDClient),
	IDAvis INT REFERENCES AVIS(IDAvis)
	IDCommande INT,
	quantité INT,
	remise FLOAT,
	sousTotal FLOAT,
	montantTaxe FLOAT,
	montantTotal FLOAT,
	dateValidation Date,

	PrimaryKey(IDCommande)

);

Create TABLE COMMANDE_PRODUIT(

	IDProduit INT REFERENCES PRODUIT(IDProduit),
	IDCommande INT REFERENCES COMMANDE(IDCommande),

);
