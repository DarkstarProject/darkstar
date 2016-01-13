-----------------------------------
-- Area: Pso'Xja
--  NPC: Avatars Gate
-----------------------------------

require("scripts/globals/missions");
local text = require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc) 
    if (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Tenzen_s_Path") == 1) then
        player:startEvent(0x0003);
    else
        player:messageSpecial(text.DOOR_LOCKED);
    end
    return 1;
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
   if (csid == 0x0003) then
     player:setVar("COP_Tenzen_s_Path",2);
   end   
end;