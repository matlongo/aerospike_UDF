local DEBUG = true
local GD

function top(flow, top_size)
  --info("Top size:"..tostring(top_size))

  local function transformer(rec)
    local touple = map()
    touple["id"] = rec["id"]
    touple["users"] = rec["users"]
    info("touple:"..tostring(touple))
    return touple
  end

  
  local function accumulate(aggregation, nextitem)
        i = 1
        while i<top_size and nextitem.users < aggregation[i].users do
            i = i + 1
        end
        info("Accumulate "..tostring(i).."    Next item "..tostring(nextitem.users))
        j = top_size - 1
        while j > i do
            aggregation[j] = aggregation[j-1]
            j = j - 1
        end
        if i < top_size then
            aggregation[i] = nextitem
        end
        return aggregation
  end
 
    
  local function reducer( this, that )
        merged = list()
        merged_index = 0
        index_this = 1
        index_that = 1
        while (merged_index < top_size) do
            merged_index = merged_index + 1
            new_map = that[index_that]
            if (this[index_this].users > that[index_that].users) then
                new_map = this[index_this]
                index_this = index_this + 1
            else
                index_that = index_that + 1
            end
            info(tostring(new_map.users))
            list.append(merged, new_map)
        end
        return merged
  end
        
    pos = 0
    initial_list = list()
    info(tostring(pos)..tostring(top_size))
    while pos < top_size do
        list.append(initial_list, map{id=-1,users=-1})
        pos = pos + 1
    end
    
    return flow:map(transformer):aggregate(initial_list, accumulate):reduce(reducer)

end
