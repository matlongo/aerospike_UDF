local DEBUG = true
local GD

function add_co_occurrence(rec, ids)
    
    co_occurrence = rec['co_occurrence']
    if co_occurrence == nil then
        co_occurrence = map()
    end
    size = list.size(ids)
    for i=1,size do
        if co_occurrence[ids[i]] == nil then
            co_occurrence[ids[i]] = 0
        end
        co_occurrence[ids[i]] = co_occurrence[ids[i]] + 1
    end
    rec['co_occurrence'] = co_occurrence
    aerospike:update(rec)
    
    return 0
    
end