-----------------------------------
-- Area: Al'Taieu
--  NPC: Swirling_Vortex
-- Type: Standard NPC
-- !pos ? ? ? 33
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs");
require("scripts/globals/limbus");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (npc:getID() == 16912908) then
        player:startEvent(159);
    else
        player:startEvent(160);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 160 and option == 1 ) then
        ResetPlayerLimbusVariable(player);
        LimbusEntrance(player,APPOLLYON_NW_SW);
    elseif (csid == 159 and option == 1 ) then
        ResetPlayerLimbusVariable(player);
        LimbusEntrance(player,APPOLLYON_SE_NE);
    end
end;
