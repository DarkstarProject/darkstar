-----------------------------------------
--	ID: 5834
--	Pair of Lucid Wings I
--	Grants 500 TP to all party members in range
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

-- TODO: AOE animation effect.
function onItemUse(target)
    target:forMembersInRange(10, function(member)
        member:addTP(500)
    end)
end