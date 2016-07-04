-----------------------------------
-- Area: Sealion's Den
-- NPC:  Sueleen
-- @pos 612 132 774 32
-----------------------------------
package.loaded["scripts/zones/Sealions_Den/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Sealions_Den/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    --player:startEvent(0x000c);
    if (player:getCurrentMission(COP) == FLAMES_IN_THE_DARKNESS and player:getVar("PromathiaStatus") == 1) then
      player:startEvent(0x0010); 
    elseif (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:hasKeyItem(LETTERS_FROM_ULMIA_AND_PRISHE)== true ) then
      player:startEvent(0x0011); 
    else
      player:startEvent(0x0014); 
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
    
    if (csid == 0x000c and option == 1) then
        toPalaceEntrance(player);
    elseif (csid == 0x0010) then
      player:setVar("PromathiaStatus",2);
    elseif (csid == 0x0011) then
          player:completeMission(COP,CALM_BEFORE_THE_STORM);
          player:addMission(COP,THE_WARRIOR_S_PATH);
          player:setVar("PromathiaStatus",0);
          player:setVar("COP_Dalham_KILL",0);
          player:setVar("COP_Boggelmann_KILL",0);
          player:setVar("Cryptonberry_Executor_KILL",0);
    end
    
end;