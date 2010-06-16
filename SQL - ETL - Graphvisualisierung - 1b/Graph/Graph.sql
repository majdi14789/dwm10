SELECT 'digraph g {'
UNION ALL
SELECT DISTINCT n_id || ' [label="' || city ||'-'|| street ||'"]'
	FROM nodes WHERE g_id = 6
UNION ALL
SELECT DISTINCT n1_id || ' -> ' || n2_id || '[label="' || duration || '-' || edgecount || '"]'
	FROM edges WHERE g_id = 6
UNION ALL
SELECT '}'