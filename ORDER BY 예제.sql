SELECT * FROM bank_account;

INSERT INTO bank_account(account_owner, balance)
VALUE
    ('워렌 버핏', 2100000000),
    ('일론 머스크', 2000000000),
    ('빌 게이츠', 1900000000),
    ('재드래곤', 1000000000);

SELECT * FROM bank_account
ORDER BY balance DESC ;

SELECT * FROM bank_account
ORDER BY account_owner DESC ;

-- ORDER BY 할 때 염두에 둘 것
-- WHRER 조건에 적어준 필터링 기준 컬럼이 INDEX가 설정되어 있는 경우
-- 자동으로 해당 INDEX에 따라서 정렬된 결과가 출력된다
SELECT * FROM bank_account
WHERE account_number > 4;   -- WHERE 조건에 들어온 인덱스가 사용되면서 자동 정렬

SELECT * FROM drink_order;

SELECT * FROM drink_order
ORDER BY customer_id IS NULL;
-- NULL 아닌경우 : 0, NULL인 경우 TRUE :1
-- ORDER BY customer_id NULLS LAST; ANSI 표준이 아니다

SELECT * FROM drink_order
ORDER BY 3, 4;

SELECT customer_id, SUM(total_amount)
FROM drink_order
GROUP BY customer_id
ORDER BY SUM(total_amount) DESC;

SELECT *
FROM drink_order
ORDER BY
    CASE order_status
        WHEN 'completed' THEN total_amount
        ELSE NULL
    END;