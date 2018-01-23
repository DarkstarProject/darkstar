-----------------------------------
-- Area: Port San d'Oria
--  NPC: Anoki
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
 if (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("COP_optional_CS_Anoki") == 0) then
 player:startEvent(724);
 elseif (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("COP_optional_CS_Anoki") == 1) then
 player:startEvent(728);
 else
 player:startEvent(519);
 end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
 if (csid == 724) then
  player:setVar("COP_optional_CS_Anoki",1);
 elseif (csid == 728) then
  player:setVar("COP_optional_CS_Anoki",2);
 end
end;

