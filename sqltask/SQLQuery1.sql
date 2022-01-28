create database SQL_task1
use SQL_task1
create table Departments(
  Id int primary key identity,
  Name nvarchar(25) not null constraint Check_name check(Len(Name)>2)
)

create table Employees(
     Id int primary key identity,
	 Fullname nvarchar(25) not null constraint Check_Fullname check(len(Fullname)>3),
	 Salary int constraint Check_Salary check(Salary>=0),
	 DepartmentId int constraint FK_Employees_DepartmentId foreign key references Departments(Id)
)
insert into Departments
values('Marketing'),
('Graphic Design'),
('Proggamming'),
('Server Adminstration')

insert into Employees
values('Samir Naghiyev',1200,2),
('Emin Asadullayev',1500,3),
('Amin Sariyev',800,2),
('Sefiqe Sadiqova',950,1),
('Elnur Sadiqzade',1100,2),
('Tunar Valizade',1000,3),
('Vidadi Azimzade',700,4),
('Kanan Zeynalli',670,1)

select e.Fullname, e.Salary,d.Name from Employees e
inner join Departments d
on e.DepartmentId=d.Id


create database SQL_task2
use SQL_task2
create table Pricing(
Id int primary key identity,
Name nvarchar(25),
Price int not null 

)
insert into Pricing
values ('free',0),
('business',29),
('developer',0)

create table Feature(
  Id int primary key identity,
  Name nvarchar(50)

)
insert into Feature
values('Quam adipiscing vitae proin'),
('Nec feugiat nisl pretium'),
('Nulla at volutpat diam uteera'),
('Pharetra massa massa ultricies'),
('Massa ultricies mi quis hendrerit')


create table PricingFeature(
  Id int primary key identity,
  PricingId int constraint FK_PricingFeature_Pricing foreign key references Pricing(Id),
  FeatureId int constraint FK_PricingFeature_Feature foreign key references Feature(Id)
)
insert into PricingFeature
values(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3),
(2,4),
(2,5),
(3,1),
(3,2),
(3,3),
(3,4),
(3,5)
select * from PricingFeature pf
join Pricing p
on pf.PricingId=p.Id
join Feature f
on pf.FeatureId=f.Id

create database SQL_task3
use SQL_task3

create table Portfolio(
  Id int primary key identity,
  Name nvarchar(30),


)
insert into Portfolio
values ('App'),
('Card'),
('Web')

create table PortfolioImages(
  Id int primary key identity,
  Name nvarchar(30),
  PortfolioId int constraint FK_PortfolioImages_Portfolio foreign key references Portfolio(Id)
)

drop table PortfolioImages
insert into PortfolioImages
values ('Care',1),
('Tube',1),
('Cocooil',1),
('Honest',2),
('Acqua',2),
('Table',2),
('Tea',3),
('Aerin',3),
('Syrnik',3)

create table Category(
  Id int primary key identity,
  Name nvarchar(30),

)
insert into Category
values ('Category1'),
('Category2'),
('Category3'),
('Category4')
create table PortfolioCategory(
  Id int primary key identity,
  PortfolioId int constraint FK_PortfolioCategory_Portfolio foreign key references Portfolio(Id),
  CategoryId int constraint FK_PortfolioCategory_Category foreign key references Category(Id)

)

insert into PortfolioCategory
values (1,1),
(1,3),
(2,1),
(2,2),
(2,4),
(3,2),
(3,3),
(3,4)

select py.Id,py.Name 'ImagesName',p.Name 'PortfolioName',c.Name 'CategoryName' from  PortfolioCategory pc
join Portfolio p
on pc.PortfolioId=p.Id
join Category c
on pc.CategoryId=c.Id
join PortfolioImages py
on py.PortfolioId=p.Id




















