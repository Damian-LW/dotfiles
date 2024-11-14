const tablesBefore = await db.getAllAsync(`
SELECT name
FROM sqlite_master
 WHERE type='table'
ORDER BY name;

`);
