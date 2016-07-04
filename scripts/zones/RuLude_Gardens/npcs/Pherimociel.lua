-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Pherimociel
-- Involved in mission: COP 1-2
-- @pos -31.627 1.002 67.956 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
      local Hrandom =math.random();
    
    if (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(0x0018);
    elseif (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(0x0019);
    elseif (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 3) then    
        player:startEvent(0x003A);
    elseif (player:getCurrentMission(COP) == FOR_WHOM_THE_VERSE_IS_SUNG  and  player:getVar("PromathiaStatus") == 0) then        
        player:startEvent(0x273E);        
    elseif (player:getCurrentMission(COP) == A_PLACE_TO_RETURN and player:getVar("PromathiaStatus") == 1) then    
        if (Hrandom<0.2) then
          player:startEvent(0x001B);
        elseif (Hrandom<0.6) then
          player:startEvent(0x001C);
        else
          player:startEvent(0x001D);
        end    
    elseif (player:getCurrentMission(COP) == MORE_QUESTIONS_THAN_ANSWERS  and  player:getVar("PromathiaStatus") == 0) then    
        player:startEvent(0x2741);    
    else
        player:startEvent(0x009b);
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

    if (csid == 0x0018) then
        player:setVar("PromathiaStatus",1); -- first cs mission 1.2 has been seen YOU CAN NOW ENTER TO PROMYVION
        player:setVar("FirstPromyvionHolla",1);
        player:setVar("FirstPromyvionMea",1);
        player:setVar("FirstPromyvionDem",1);
    elseif (csid == 0x003A) then    
        player:setVar("COP_Tenzen_s_Path",4);
    elseif (csid == 0x273E or 0x2741) then    
        player:setVar("PromathiaStatus",1);    
    end
    
end;