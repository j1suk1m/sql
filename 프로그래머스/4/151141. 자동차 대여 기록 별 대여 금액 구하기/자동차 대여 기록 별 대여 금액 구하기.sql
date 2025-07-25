WITH 
  TRUCK_DISCOUNT_PLAN AS ( -- 트럭의 대여 기간 종류별 할인 정책 테이블
    SELECT 
      DURATION_TYPE, 
      DISCOUNT_RATE
    FROM
      CAR_RENTAL_COMPANY_DISCOUNT_PLAN
    WHERE
      CAR_TYPE = '트럭'),
  CURRENT_TRUCK_RENTAL AS ( -- 대여 중인 트럭 정보 테이블
    SELECT
      CAR_ID,
      DAILY_FEE
    FROM
      CAR_RENTAL_COMPANY_CAR
    WHERE
      CAR_TYPE = '트럭')

SELECT 
  HISTORY_ID, 
  ROUND(DAILY_FEE * (1 - (IFNULL(DISCOUNT_RATE, 0) * 0.01)) * (DATEDIFF(END_DATE, START_DATE) + 1)) AS FEE -- 할인율을 적용한 총 대여 금액
FROM 
  CAR_RENTAL_COMPANY_RENTAL_HISTORY AS HISTORY -- 자동차 대여 기록 테이블
JOIN 
  CURRENT_TRUCK_RENTAL AS RENTAL -- 대여 중인 트럭 정보 테이블
ON 
  HISTORY.CAR_ID = RENTAL.CAR_ID
LEFT OUTER JOIN 
  TRUCK_DISCOUNT_PLAN AS DISCOUNT -- 트럭의 대여 기간 종류별 할인 정책 테이블
ON 
  DURATION_TYPE LIKE (CASE
                        WHEN DATEDIFF(END_DATE, START_DATE) + 1 >= 90 THEN '90%'
                        WHEN DATEDIFF(END_DATE, START_DATE) + 1 >= 30 THEN '30%'
                        WHEN DATEDIFF(END_DATE, START_DATE) + 1 >= 7 THEN '7%'
                        ELSE 'NONE'
                      END) 
ORDER BY 
  FEE DESC, 
  HISTORY_ID DESC