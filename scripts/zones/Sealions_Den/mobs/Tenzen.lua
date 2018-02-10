-----------------------------------
-- Area: Sealion's Den
--  NPC: Tenzen
-----------------------------------
require("scripts/zones/Sealions_Den/MobIDs");
-----------------------------------

function onMobEngaged(mob,target)
    -- three tarus fight with tenzen
    local mobId = mob:getID();
    local offset = mobId - WARRIORS_PATH_OFFSET;
    if (offset >= 0 and offset <= 8) then
        for i = mobId + 1, mobId + 3 do
            GetMobByID(i):updateEnmity(target);
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;