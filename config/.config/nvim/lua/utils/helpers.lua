local M = {}

function M.add_to_table(table, key, value)
  table[key] = value
  return table
end

function M.add_to_table_silent(table, key, value)
  table[key] = value
end

function M.remove_from_table(table, key)
  table[key] = nil
end

function M.emty_table(table)
  for k in pairs(table) do
    table[k] = nil
  end
end

function M.table_contains(table, key)
  return table[key] ~= nil
end

function M.table_contains_value(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
end

function M.get_table_value(table, key)
  for k, v in pairs(table) do
    if k == key then
      return v
    end
  end
end

function M.get_table_key(table, value)
  for k, v in pairs(table) do
    if v == value then
      return k
    end
  end
end

function M.get_table_contents(table)
  for k, v in pairs(table) do
    print(k, v)
  end
end

function M.table_length(table)
  local count = 0
  for _ in pairs(table) do
    count = count + 1
  end
  return count
end

function M.get_nested_table_value(table, key)
  for _, v in pairs(table) do
    for k, nv in pairs(v) do
      if k == key then
        return nv
      end
    end
  end
end

function M.get_nested_table_key(table, value)
  for _, v in pairs(table) do
    for k, nv in pairs(v) do
      if nv == value then
        return k
      end
    end
  end
end

function M.update_nested_table_value(table, value, new_value)
  for _, v in pairs(table) do
    for k, nv in pairs(v) do
      if nv == value then
        v[k] = new_value
      end
    end
  end
end

return M
