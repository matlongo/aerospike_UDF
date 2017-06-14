local DEBUG = true
local GD

function column_sum(flow)

    local function transformer(rec)
        local touple = map()
        touple["co_occurrence"] = rec["co_occurrence"]
        if touple["co_occurrence"] == nil then
            touple["co_occurrence"] = map()
        end
        return touple
    end

  
    local function accumulate(aggregation, nextitem)
        for k, v in map.pairs(nextitem.co_occurrence) do
            if aggregation[k] == nil then
                aggregation[k] = v
            else
                aggregation[k] = aggregation[k] + v
            end
        end
        return aggregation
    end
 
    
    local function reducer( this, that )
        for k, v in map.pairs(that) do
            if this[k] == nil then
                this[k] = v
            else
                this[k] = this[k] + v
            end
        end
        return this
    end
    
    return flow:map(transformer):aggregate(map(), accumulate):reduce(reducer)

end