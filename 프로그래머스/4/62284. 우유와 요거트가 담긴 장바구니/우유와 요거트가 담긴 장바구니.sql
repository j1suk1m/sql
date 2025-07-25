WITH YOGURT_MILK AS ( -- 장바구니에 담긴 Yogurt 또는 Milk 정보 테이블
  SELECT ID, CART_ID, NAME
  FROM CART_PRODUCTS 
  WHERE NAME REGEXP '^(Yogurt|Milk)'
  GROUP BY CART_ID, NAME -- 동일한 상품을 다른 장바구니에 담은 경우, 중복 제거
)

SELECT CART_ID
FROM YOGURT_MILK
GROUP BY CART_ID -- 장바구니 아이디에 대해 그룹화
HAVING COUNT(*) = 2 -- 장바구니에 Yogurt와 Milk가 모두 담겼음을 의미
ORDER BY CART_ID