--1. 몬스터의 이름과 그 몬스터의 장소와 위험도를 표시
select m.mname as "몬스터 이름", p.pname as "장소 이름", p.dangerous as "위험도"
from monster m join place p
using (pno);

--2. 5번 캐릭터보다 늦게 만들어진 캐릭터 번호와 만들어진 날짜 출력
select c2.cno as "캐릭터 번호", c2.formation as "날짜"
from character c1 join character c2
on c1.formation < c2.formation
where c1.cno = 5;

--3. 각직업의 상위직업을 출력 상위직업이 없는것은 비어 있음.
select j.jname ||'의 상위직업은 '|| h.jname as "상위직업 알아보기"
from job j join job h
on j.jhigh = h.jno (+);

--4. 캐릭터번호별로 캐릭터가 한 대를 때리면 죽는 몬스터 검색
select c.cno as "캐릭터 번호", c.cattack as " 캐릭터 공격력", m.mname as "몬스터 이름", m.mhealth as "몬스터 체력"
from character c, monster m 
where c.cattack > m.mhealth;

--5. 돼지치기 막대를 사기 위해서 한마리만 잡아도 되는 몬스터의 장소와 이름을 알려줌
select e.ename as "장비 이름", e.price as "장비 가격", p.pname as "장소", m.mname as "몬스터 이름", m.gold as "주는 골드"
from equipment e, place p, monster m 
where p.pno = m.pno
and e.ename = '돼지치기 막대'
and e.price < m.gold;

--1. 검사와 같은 공격형태(근거리)인 직업 출력
select jname as "직업명", aform as "공격형태"
from job
where aform = ( select aform
                from job
                where jname = '검사');
                
--2. 캐릭터의 평균공격력보다 높은 공격력의 캐릭터 출력
select cno, cattack
from character
where cattack > ( select avg(cattack)
                  from character);

--3. 지역별로 제일 공격력이 쌘 몬스터 출력
select p.pname as "지역명", m.mname as "몬스터 이름", m.mattack as "공격력"
from monster m, place p
where m.pno = p.pno
and mattack in ( select max(mattack)
                 from monster
                 group by pno);
                 
--4. 방패에서 제일 비싼것보다 비싼 장비들 출력
select e.ename as "이름", e.price as "가격", et.etname as "유형"
from equipment e, etype et
where e.etno = et.etno
and price > any ( select max(price)
                  from equipment
                  where etno = 5)
order by e.price;

--5. 평균 공격력보다 높으며 평균 골드보다 많은 골드를 주는 몬스터 검색
select mname as "이름", mattack as "공격력", gold as "돈"
from monster
where mattack > ( select avg(mattack)
                  from monster )
and gold > ( select avg(gold)
             from monster) ;

