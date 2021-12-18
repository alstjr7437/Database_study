--1. ������ �̸��� �� ������ ��ҿ� ���赵�� ǥ��
select m.mname as "���� �̸�", p.pname as "��� �̸�", p.dangerous as "���赵"
from monster m join place p
using (pno);

--2. 5�� ĳ���ͺ��� �ʰ� ������� ĳ���� ��ȣ�� ������� ��¥ ���
select c2.cno as "ĳ���� ��ȣ", c2.formation as "��¥"
from character c1 join character c2
on c1.formation < c2.formation
where c1.cno = 5;

--3. �������� ���������� ��� ���������� ���°��� ��� ����.
select j.jname ||'�� ���������� '|| h.jname as "�������� �˾ƺ���"
from job j join job h
on j.jhigh = h.jno (+);

--4. ĳ���͹�ȣ���� ĳ���Ͱ� �� �븦 ������ �״� ���� �˻�
select c.cno as "ĳ���� ��ȣ", c.cattack as " ĳ���� ���ݷ�", m.mname as "���� �̸�", m.mhealth as "���� ü��"
from character c, monster m 
where c.cattack > m.mhealth;

--5. ����ġ�� ���븦 ��� ���ؼ� �Ѹ����� ��Ƶ� �Ǵ� ������ ��ҿ� �̸��� �˷���
select e.ename as "��� �̸�", e.price as "��� ����", p.pname as "���", m.mname as "���� �̸�", m.gold as "�ִ� ���"
from equipment e, place p, monster m 
where p.pno = m.pno
and e.ename = '����ġ�� ����'
and e.price < m.gold;

--1. �˻�� ���� ��������(�ٰŸ�)�� ���� ���
select jname as "������", aform as "��������"
from job
where aform = ( select aform
                from job
                where jname = '�˻�');
                
--2. ĳ������ ��հ��ݷº��� ���� ���ݷ��� ĳ���� ���
select cno, cattack
from character
where cattack > ( select avg(cattack)
                  from character);

--3. �������� ���� ���ݷ��� �� ���� ���
select p.pname as "������", m.mname as "���� �̸�", m.mattack as "���ݷ�"
from monster m, place p
where m.pno = p.pno
and mattack in ( select max(mattack)
                 from monster
                 group by pno);
                 
--4. ���п��� ���� ��Ѱͺ��� ��� ���� ���
select e.ename as "�̸�", e.price as "����", et.etname as "����"
from equipment e, etype et
where e.etno = et.etno
and price > any ( select max(price)
                  from equipment
                  where etno = 5)
order by e.price;

--5. ��� ���ݷº��� ������ ��� ��庸�� ���� ��带 �ִ� ���� �˻�
select mname as "�̸�", mattack as "���ݷ�", gold as "��"
from monster
where mattack > ( select avg(mattack)
                  from monster )
and gold > ( select avg(gold)
             from monster) ;

