-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Pherimociel
-- Involved in mission: COP 1-2
-- !pos -31.627 1.002 67.956 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/RuLude_Gardens/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
      local Hrandom =math.random();

    if (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 0) then
        player:startEvent(24);
    elseif (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(25);
    elseif (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 3) then
        player:startEvent(58);
    elseif (player:getCurrentMission(COP) == FOR_WHOM_THE_VERSE_IS_SUNG  and  player:getVar("PromathiaStatus") == 0) then
        player:startEvent(10046);
    elseif (player:getCurrentMission(COP) == A_PLACE_TO_RETURN and player:getVar("PromathiaStatus") == 1) then
        if (Hrandom<0.2) then
          player:startEvent(27);
        elseif (Hrandom<0.6) then
          player:startEvent(28);
        else
          player:startEvent(29);
        end
    elseif (player:getCurrentMission(COP) == MORE_QUESTIONS_THAN_ANSWERS  and  player:getVar("PromathiaStatus") == 0) then
        player:startEvent(10049);
    elseif (player:getCurrentMission(TOAU) == UNRAVELING_REASON) then
        if (player:getVar("TOAUM40_STARTDAY") ~= VanadielDayOfTheYear() and player:needToZone() == false) then
            player:startEvent(10098,0,0,0,0,0,0,0,0);
        else
            player:startEvent(10099);
        end
    else
        player:startEvent(155);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("Update CSID: %u",csid);
    -- printf("Update RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("Finish CSID: %u",csid);
    -- printf("Finish RESULT: %u",option);

    if (csid == 10098) then
        player:setPos(0,0,0,0,51);
    elseif (csid == 24) then
        player:setVar("PromathiaStatus",1); -- first cs mission 1.2 has been seen YOU CAN NOW ENTER TO PROMYVION
        player:setVar("FirstPromyvionHolla",1);
        player:setVar("FirstPromyvionMea",1);
        player:setVar("FirstPromyvionDem",1);
    elseif (csid == 58) then
        player:setVar("COP_Tenzen_s_Path",4);
    elseif (csid == 10046 or 10049) then
        player:setVar("PromathiaStatus",1);
    end
end;
