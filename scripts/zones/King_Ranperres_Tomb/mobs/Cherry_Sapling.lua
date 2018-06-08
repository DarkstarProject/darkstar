-----------------------------------
-- Area: King Ranperres Tomb
--  NPC: Cherry Sapling
-- Note: PH for Cemetery Cherry
-----------------------------------
require("scripts/zones/King_Ranperres_Tomb/MobIDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local allSaplingsDead = true;
    for i = CHERRY_SAPLING_OFFSET, CHERRY_SAPLING_OFFSET + 12 do
        local mob = GetMobByID(i);
        if (mob ~= nil and mob:getName() == 'Cherry_Sapling' and mob:isAlive()) then
            allSaplingsDead = false;
            break;
        end
    end
    
    if (allSaplingsDead) then
        SpawnMob(CHERRY_SAPLING_OFFSET + 10); -- Cemetery Cherry
    end
end;
