-----------------------------------
-- Area: Mhaura
--  NPC: Numi Adaligo
--  Involved In Quest: RYCHARDE_THE_CHEF
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(50);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    local RychardetheChef = player:getQuestStatus(OTHER_AREAS,RYCHARDE_THE_CHEF);
    local QuestStatus=player:getVar("QuestRychardetheChef_var");

    if ((option == 2) and (RychardetheChef == QUEST_AVAILABLE) and (tonumber(QuestStatus) == 0)) then
        player:setVar("QuestRychardetheChef_var",1);  -- first stage of rycharde the chef quest
    end;

end;
