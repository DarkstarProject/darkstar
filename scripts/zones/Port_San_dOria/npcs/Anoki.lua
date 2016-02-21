-----------------------------------
-- Area: Port San d'Oria
-- NPC: Anoki
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
 if (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("COP_optional_CS_Anoki") == 0) then
 player:startEvent(0x02D4);
 elseif (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("COP_optional_CS_Anoki") == 1) then
 player:startEvent(0x02D8);
 else
 player:startEvent(0x207);
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
 if (csid == 0x02D4) then
  player:setVar("COP_optional_CS_Anoki",1);
 elseif (csid == 0x02D8) then
  player:setVar("COP_optional_CS_Anoki",2);
 end
end;



