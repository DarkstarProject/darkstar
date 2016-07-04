-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Nadee Periyaha
-- Standard Info NPC
-- @pos -10.802 0.000 -1.198 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local ratRaceProg = player:getVar("ratraceCS");
    if (ratRaceProg == 1) then
       player:startEvent(0x0351);
    elseif (ratRaceProg == 2) then  
       player:startEvent(0x0353);
    elseif (ratRaceProg >= 3) then  
       player:startEvent(0x0354);
    else
       player:startEvent(0x005a);
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0351) then
       player:setVar("ratraceCS",2);
    end
end;



