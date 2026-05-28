-- Create Data
CREATE TABLE StudentScores
(
    StudentName VARCHAR(50),
    Subject VARCHAR(50),
    Score INT
);
INSERT INTO StudentScores
VALUES
('John', 'Math', 90),
('John', 'English', 85),
('John', 'Science', 88),

('Sara', 'Math', 95),
('Sara', 'English', 92),
('Sara', 'Science', 90);



-- Pivot the data
SELECT * 
FROM (
    SELECT 
        StudentName,
        Subject,
        Score
    FROM StudentScores
) AS source_table
PIVOT 
(
    SUM(score)

    FOR Subject 
    IN ([Math], [English], [Science])
) AS pvt_table;
