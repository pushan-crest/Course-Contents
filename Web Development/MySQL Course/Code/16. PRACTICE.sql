USE PET_STORE;

select * from cats;

UPDATE CATS SET NAME = 'JACK' WHERE NAME = 'JACKSON';

select * from cats;

UPDATE CATS SET BREED = 'BRITISH SHORTHAIR' WHERE NAME = 'RINGO';
select * from cats;

UPDATE CATS SET AGE = 12 WHERE BREED = 'MAINE COON';
select * from cats;
