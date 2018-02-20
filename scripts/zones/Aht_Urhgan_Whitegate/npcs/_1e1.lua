-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Salaheem's Sentinels (Door)
-- !pos 23 -6 -63 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == PATH_OF_DARKNESS and player:getVar("AhtUrganStatus") > 0) then
        return;
    end

    npc:openDoor(npc:getID());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

