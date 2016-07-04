-----------------------------------
--  Area: Al'Taieu
--  NPC:  Swirling_Vortex
--  Type: Standard NPC
--  @zone 33
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
        player:startEvent(0x009F);
    else
        player:startEvent(0x00A0);   
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
    if (csid == 0x00A0 and option == 1 ) then
        ResetPlayerLimbusVariable(player);
        LimbusEntrance(player,APPOLLYON_NW_SW);
    elseif (csid == 0x009F and option == 1 ) then
        ResetPlayerLimbusVariable(player);
        LimbusEntrance(player,APPOLLYON_SE_NE);
    end 
end;
