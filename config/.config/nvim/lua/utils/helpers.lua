local H = {}

function H.toggle (a, b)
  local x = b
  return function ()
    if x == a then x = b else x = a end
    return x
  end
end

function H.add_to_table(table, key, value)
  table[key] = value
end

function H.remove_from_table(table, key)
  table[key] = nil
end

function H.table_contains(table, key)
  return table[key] ~= nil
end

function H.get_table_value(table, key)
  for k,v in pairs(table) do
    if k == key then
    return v
  end
  end
end

function H.get_table_key(table, value)
  for k,v in pairs(table) do
    if v == value then
    return k
  end
  end
end

return H
