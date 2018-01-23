-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Chasalvige
-- Type: Standard Info NPC
--  Involved in Mission: The Road Forks
--  Involved in Mission: Promathia Mission 5 - Three Paths
--  @zone 231
-- !pos 96.432 -0.520 134.046
--
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
  if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status") == 3) then
  player:startEvent(38); --COP event
  elseif (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("COP_optional_CS_chasalvigne") == 0) then
  player:startEvent(761);
  elseif (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Ulmia_s_Path") == 2) then
  player:startEvent(762);
  else
  player:startEvent(6);
  end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 38) then
      player:setVar("EMERALD_WATERS_Status",4);
    elseif (csid == 761) then
      player:setVar("COP_optional_CS_chasalvigne",1);
    elseif (csid == 762) then
      player:setVar("COP_Ulmia_s_Path",3);
    end
end;

