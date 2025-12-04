DO $$
DECLARE
  r RECORD;
BEGIN
  FOR r IN
    SELECT 
      table_name, column_name
    FROM information_schema.columns
    WHERE column_name = 'id' AND table_schema = 'public'
  LOOP
    EXECUTE format(
      'SELECT setval(pg_get_serial_sequence(''"%s"'', ''%s''), COALESCE((SELECT MAX(%I) FROM %I), 0) + 1, false);',
      r.table_name, r.column_name, r.column_name, r.table_name
    );
  END LOOP;
END $$;