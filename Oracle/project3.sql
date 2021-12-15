--1. 500��� �̻� �ִ� ���� �˻� 
select * from monster
where gold > 500;

--2. ���� ���� ��� �˻�
select * from equipment
where ename like '%��%';

--3. ���Ÿ� ���� �� ���� ������ ���� ���� �˻�
select * from job
where jhigh is null
and aform = '���Ÿ�';

--4. ���� �Ǵ� ���� �� ���ݷ��� 5,50 �Ǵ� 100�� �ƴ� ��� ���
select ename, etno, eattack
from equipment
where etno in(3,4)
and eattack not in(5,50,100);

--5. ������ ��� ���ݰ� ���� ��� ���� ���� �� ��� ���
select round(avg(price)) as "��� ����",
       max(price) as "���� ��� ����",
       min(price) as "���� �� ����"
from equipment;

--6. ���ݷ��� �ִ� ��� �� ���ϱ�
select count(eattack) as "���ݷ��� �ִ� ���"
from equipment;

--7. ĳ���͵��� ��������� 7500���� ���� ĳ���� ���ϱ�
select cno, round(sysdate-formation) as "����� ������"
from character
where round(sysdate-formation) > 7500;

--8. ���� ��ġ�� ���� ���� ������ ��� ��� (�������� ����)
select pno as "���� ��ġ", round(avg(gold)) as "��� ���"
from monster
group by pno
order by 2;

--9. ���� ��� �����ϰ� ����� ��� ������ 50 �̻��� ��� ������ ���� ���
select decode(etno, 1, '����',
                    2, '��',
                    3, '����',
                    4, '����',
                    5, '����')as "��� ����", count(*) as "��� ����", avg(edefense) as "��� ����"
from equipment
where not etno = 4
group by etno
having avg(edefense) > 50
order by avg(edefense) desc;

--10. �� �������� ĳ���� ���� �� ��� ���ݷ�,���� ���
select decode(jno, 1, '����', 
                   5, '������',
                   9, '�ü�',
                   13, '����',
                   17, '����') as "���� �̸�",
       count(*) as "ĳ���� ����",
       round(avg(cattack)) as "��� ���ݷ�",
       round(avg(cdefense)) as "��� ����"
from character
group by jno
order by jno;
