create table Companies(comapanyID int not null auto_increment primary key,
						companyName varchar(20) not null,
						hqAddress varchar(100) not null,
						dateOfCreation Date not null,
						country varchar(20) not null);


create table Products(productID int not null auto_increment primary key,
						companyID int not null,
						productName varchar(20) not null,
						picture varchar(100) not null,
						description varchar(100) not null,
						price decimal(6,2) unsigned not null,
						quantityInStock int not null,
						categoryName varchar(20) not null);


create table Categories(categoryName varchar(20) not null primary key,
						createdAt datetime not null,
						deletedAt datetime);


create table Items(itemID int not null auto_increment primary key,
					quantity int not null,
					producID int not null);


create table Orders(orderID int not null auto_increment primary key,
					status varchar(20) not null,
					createdAt datetime not null,
					deliveryID int not null,
					itemID int not null,
					email varchar(30));


create table Deliveries(deliveryID int not null auto_increment primary	
						key,
						deliveredAt datetime not null,
						shippedAt datetime not null,
						type varchar(20) not null,
						addressID int not null);


create table Users(email varchar(30) not null primary key,
					phoneNumber char(10) not null,
					dateOfbirth date not null,
					type varchar(5) not null,
					createdAt datetime not null,
					sex char(1) not null,
					lastname varchar(20) not null,
					firstname varchar(20) not null,
					password varchar(10) not null,
					defaultAddressID int not null);


create table Addresses( AddressID int not null auto_increment primary key,
						userEmail varchar(30) not null,
						street varchar(50) not null,
						apartment varchar(20) not null,
						country varchar(15) not null,
						zip int not null);


create table Demographics(zip int not null primary key,
							country varchar(15) not null,
							state varchar(20) not null,
							city varchar(20) not null);	 																					

