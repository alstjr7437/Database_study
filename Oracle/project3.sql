--1. 500골드 이상 주는 몬스터 검색 
select * from monster
where gold > 500;

--2. 블랙이 들어가는 장비 검색
select * from equipment
where ename like '%블랙%';

--3. 원거리 직업 중 상위 직업이 없는 직업 검색
select * from job
where jhigh is null
and aform = '원거리';

--4. 무기 또는 반지 중 공격력이 5,50 또는 100이 아닌 장비 출력
select ename, etno, eattack
from equipment
where etno in(3,4)
and eattack not in(5,50,100);

--5. 장비들의 평균 가격과 제일 비싼 장비와 제일 싼 장비 출력
select round(avg(price)) as "평균 가격",
       max(price) as "제일 비싼 가격",
       min(price) as "제일 싼 가격"
from equipment;

--6. 공격력이 있는 장비 수 구하기
select count(eattack) as "공격력이 있는 장비"
from equipment;

--7. 캐릭터들의 만들어지고 7500일이 지난 캐릭터 구하기
select cno, round(sysdate-formation) as "만들고 지난날"
from character
where round(sysdate-formation) > 7500;

--8. 몬스터 위치에 따른 지역 몬스터의 평균 골드 (오름차순 정렬)
select pno as "몬스터 위치", round(avg(gold)) as "평균 골드"
from monster
group by pno
order by 2;

--9. 무기 장비를 제외하고 장비의 평균 방어력이 50 이상인 장비 유형에 따른 출력
select decode(etno, 1, '모자',
                    2, '옷',
                    3, '반지',
                    4, '무기',
                    5, '방패')as "장비 유형", count(*) as "장비 갯수", avg(edefense) as "평균 방어력"
from equipment
where not etno = 4
group by etno
having avg(edefense) > 50
order by avg(edefense) desc;

--10. 각 직업별의 캐릭터 갯수 및 평균 공격력,방어력 출력
select decode(jno, 1, '전사', 
                   5, '마법사',
                   9, '궁수',
                   13, '도적',
                   17, '해적') as "직업 이름",
       count(*) as "캐릭터 갯수",
       round(avg(cattack)) as "평균 공격력",
       round(avg(cdefense)) as "평균 방어력"
from character
group by jno
order by jno;
