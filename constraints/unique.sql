drop table customer;
create table customer (
    -- id varchar2(20) UNIQUE,
    id varchar2(20) CONSTRAINT uq_customer_id UNIQUE CONSTRAINT nn_customer_id not null,
    pwd varchar2(20) not null,
    name varchar2(30) constraint nn_name not null,
    phone varchar2(20),
    address varchar2(100)
    --CONSTRAINT uq_customer_id2 UNIQUE(id)
);

insert into customer(id,pwd,name) VALUES('vstar','1234','kny');

select * from customer;