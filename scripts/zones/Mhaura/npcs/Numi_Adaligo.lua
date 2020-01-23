-----------------------------------
-- Area: Mhaura
--  NPC: Numi Adaligo
--  Involved In Quest: RYCHARDE_THE_CHEF
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- TODO This is meant to be an additional menu option
    if player:getCurrentMission(ROV) == dsp.mission.id.rov.EMISSARY_FROM_THE_SEAS and player:getVar("RhapsodiesStatus") == 0 then
        player:startEvent(369)
    else
        player:startEvent(50)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    local RychardetheChef = player:getQuestStatus(OTHER_AREAS_LOG,dsp.quest.id.otherAreas.RYCHARDE_THE_CHEF);
    local QuestStatus=player:getCharVar("QuestRychardetheChef_var");

    if ((option == 2) and (RychardetheChef == QUEST_AVAILABLE) and (tonumber(QuestStatus) == 0)) then
        player:setCharVar("QuestRychardetheChef_var",1);  -- first stage of rycharde the chef quest
    elseif csid == 177 then
        player:completeMission(ROV, dsp.mission.id.rov.EMISSARY_FROM_THE_SEAS)
        player:addMission(ROV, dsp.mission.id.rov.SET_FREE)
    end

end;
