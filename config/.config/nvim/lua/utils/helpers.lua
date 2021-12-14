local H = {}

function H.toggle(a, b)
  local x = b
  return function()
    if x == a then
      x = b
    else
      x = a
    end
    return x
  end
end

function H.add_to_table(table, key, value)
  table[key] = value
  return table
end

function H.add_to_table_silent(table, key, value)
  table[key] = value
end

function H.remove_from_table(table, key)
  table[key] = nil
end

function H.emty_table(table)
  for k in pairs(table) do
    table[k] = nil
  end
end

function H.table_contains(table, key)
  return table[key] ~= nil
end

function H.table_contains_value(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    else
      return false
    end
  end
end

function H.get_table_value(table, key)
  for k, v in pairs(table) do
    if k == key then
      return v
    end
  end
end

function H.get_table_key(table, value)
  for k, v in pairs(table) do
    if v == value then
      return k
    end
  end
end

function H.get_table_contents(table)
  for k, v in pairs(table) do
    print(k, v)
  end
end

function H.table_length(table)
  local count = 0
  for _ in pairs(table) do
    count = count + 1
  end
  return count
end

function H.get_nested_table_value(table, key)
  for _, v in pairs(table) do
    for k, nv in pairs(v) do
      if k == key then
        return nv
      end
    end
  end
end

function H.get_nested_table_key(table, value)
  for _, v in pairs(table) do
    for k, nv in pairs(v) do
      if nv == value then
        return k
      end
    end
  end
end

return H
