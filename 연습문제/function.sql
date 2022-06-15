-- 1. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����϶�.
select max(salary)as �ְ��, min(salary) as ������, sum(salary) as �Ѿ�, round(avg(salary))as ��ձ޿� from employee; --1

-- 2. �� ��� ���� �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����Ͻÿ�.
select job, max(salary) as �ְ��, min(salary) as ������, sum(salary) as �Ѿ�, round(avg(salary))as ��վ� from employee group by job; --2

-- 3. count(*)�Լ��� �̿��Ͽ� �������� ������ ������� ����Ͻÿ�.
select job, count(*) from employee group by job; --3

-- 4. ������ ���� �����Ͻÿ�.
selEct job, count(job) from employee group by job having job = 'MANAGER';
select * from employee where eno in(select distinct manager from employee where manager is not null);
select DISTINCT manager from employee where manager is not null;

-- 5. �޿� �ְ�װ� �������� ���̸� ����Ͻÿ�.
select max(salary)-min(salary) from employee; --5

-- 6. ���޺� ����� ���� �޿��� ����Ͻÿ�, �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ���ܽ�Ű�� ����� �޿��� ���� ������������ �����Ͽ� ����Ͻÿ�.
select job, min(salary)as ������ from employee where manager is not null 
    group by job having min(salary) > 2000 order by ������ desc; --6
    
-- 7. �� �μ��� ���� �μ���ȣ, �����, �μ� ���� ��� ����� ��� �޿��� ����Ͻÿ�.
select dno, count(eno), round(avg(salary)) from employee group by dno; --7

-- 8. �� �μ��� ���� �μ���ȣ, �̸�, ������, �����, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�.
select dno, decode(dno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES') �̸�,
    decode(dno, 10, 'LONDON', 20, 'SEOUL', 30, 'NEWYORK'),
    count(*), round(avg(salary)) from employee group by dno; -- 8
select e.dno, dname, cityname, count(e.dno),round(avg(salary))
    from employee e, department d, loc l
    where e.dno=d.dno and d.loc=l.loc group by e.dno, d.dname, l.cityname; -- 8
    
-- 9. ������ ǥ���� ���� �ش� ������ ���� �μ���ȣ�� �μ��� �� �μ� 10,20,30�� �޿� �Ѿ��� ���� ����Ͻÿ�. 
-- �� �÷��� ��Ī�� ���� job, �μ� 10, �μ� 20, �μ� 30, �Ѿ����� �����Ͻÿ�
select job, e.dno, (select dname from department where dno=e.dno)dname, sum(salary) 
from employee e group by job, dno order by job, dno; --9

