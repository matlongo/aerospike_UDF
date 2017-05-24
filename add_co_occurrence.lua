local DEBUG = true
local GD

function add_co_occurrence(rec, ids)
    
    info("Maaat"..tostring(ids))
    co_occurrence = rec['co_occurrence']
    info(tostring(co_occurrence))
    size = list.size(ids)
    for i=1,size do
        info(tostring(ids[i]))
        info(tostring(co_occurrence[ids[i]]))
        co_occurrence[ids[i]] = co_occurrence[ids[i]] + 1
    end
    rec['co_occurrence'] = co_occurrence
    aerospike:update(rec)
    
    return 0
    
end