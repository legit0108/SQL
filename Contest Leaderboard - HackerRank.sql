-- Group by to find max score, followed by a group by to find sum of these max scores, and a join

SELECT RESULT_SET.HACKER_ID, NAME, SUM(MAX_SCORE) AS TOTAL_SCORE FROM
(SELECT HACKER_ID, MAX(SCORE) AS MAX_SCORE FROM SUBMISSIONS
GROUP BY HACKER_ID, CHALLENGE_ID) AS RESULT_SET 
JOIN HACKERS
ON HACKERS.HACKER_ID = RESULT_SET.HACKER_ID
GROUP BY HACKER_ID, NAME
HAVING TOTAL_SCORE!=0
ORDER BY TOTAL_SCORE DESC,
HACKER_ID ASC; 