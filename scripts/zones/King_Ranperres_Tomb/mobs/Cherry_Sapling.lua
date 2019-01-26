-----------------------------------
-- Area: King Ranperres Tomb
--  NPC: Cherry Sapling
-- Note: PH for Cemetery Cherry
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local allSaplingsDead = true;
    for i = ID.mob.CHERRY_SAPLING_OFFSET, ID.mob.CHERRY_SAPLING_OFFSET + 12 do
        local mob = GetMobByID(i);
        if (mob ~= nil and mob:getName() == 'Cherry_Sapling' and mob:isAlive()) then
            allSaplingsDead = false;
            break;
        end
    end
    
    if (allSaplingsDead) then
        SpawnMob(ID.mob.CHERRY_SAPLING_OFFSET + 10); -- Cemetery Cherry
    end
end;
