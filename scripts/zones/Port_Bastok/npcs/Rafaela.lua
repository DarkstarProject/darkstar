-----------------------------------
-- Area: Port Bastok
-- NPC: Rafaela
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

player:startEvent(0x0016);

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

PastPerfectVar = player:getVar("PastPerfectVar");

    if (csid == 0x0016 and PastPerfectVar == 1) then
        player:setVar("PastPerfectVar",2);
    end

end;



