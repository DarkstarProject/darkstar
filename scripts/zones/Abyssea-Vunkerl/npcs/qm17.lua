-----------------------------------
-- Zone: Abyssea-Vunkeral
--  NPC: ???
-- Spawns: Sedna
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17666508) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(GLOSSY_SEA_MONK_SUCKER) and player:hasKeyItem(SHIMMERING_PUGIL_SCALE)) then
            player:startEvent(1015, GLOSSY_SEA_MONK_SUCKER, SHIMMERING_PUGIL_SCALE); -- Ask if player wants to use KIs
        else
            player:startEvent(1120, GLOSSY_SEA_MONK_SUCKER, SHIMMERING_PUGIL_SCALE); -- Do not ask, because player is missing at least 1.
        end
    end
]]
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 1015 and option == 1) then
        SpawnMob(17666508):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(GLOSSY_SEA_MONK_SUCKER);
        player:delKeyItem(SHIMMERING_PUGIL_SCALE);
    end
end;