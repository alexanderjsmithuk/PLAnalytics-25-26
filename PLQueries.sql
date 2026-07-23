-- =====================================================
-- Premier League 2025/26
-- Author: Alexander Smith
-- =====================================================

-- -----------------------------------------------------
-- 1. TOP ATTACKING EFFICIENCY (G+A PER 90)
-- Filtered for players with >= 900 minutes played
-- -----------------------------------------------------
SELECT 
    player,
    squad,
    pos,
    min,
    gls,
    ast,
    g_plus_a,
    ga_per90
FROM player_stats
WHERE min >= 900
ORDER BY ga_per90 DESC
LIMIT 10;

-- -----------------------------------------------------
-- 2. SQUAD PERFORMANCE AGGREGATES
-- Total goals, assists, and contributions per team
-- -----------------------------------------------------
SELECT 
    squad,
    COUNT(player) AS total_players,
    SUM(gls) AS total_goals,
    SUM(ast) AS total_assists,
    SUM(g_plus_a) AS total_contributions,
    ROUND(AVG(min), 0) AS avg_player_minutes
FROM player_stats
GROUP BY squad
ORDER BY total_contributions DESC;