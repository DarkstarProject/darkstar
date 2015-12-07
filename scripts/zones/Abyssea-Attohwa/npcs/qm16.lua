-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: ???
-- Spawns: Itzpapalotl
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17658277) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(VENOMOUS_WAMOURA_FEELER) and player:hasKeyItem(BULBOUS_CRAWLER_COCOON)
        and player:hasKeyItem(DISTENDED_CHIGOE_ABDOMEN)) then  -- I broke it into 3 lines at the 'and' because it was so long.
            player:startEvent(1022, VENOMOUS_WAMOURA_FEELER, BULBOUS_CRAWLER_COCOON, DISTENDED_CHIGOE_ABDOMEN); -- Ask if player wants to use KIs
        else
            player:startEvent(1023, VENOMOUS_WAMOURA_FEELER, BULBOUS_CRAWLER_COCOON, DISTENDED_CHIGOE_ABDOMEN); -- Do not ask, because player is missing at least 1.
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
    if (csid == 1022 and option == 1) then
        SpawnMob(17658277):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(VENOMOUS_WAMOURA_FEELER);
        player:delKeyItem(BULBOUS_CRAWLER_COCOON);
        player:delKeyItem(DISTENDED_CHIGOE_ABDOMEN);
    end
end;