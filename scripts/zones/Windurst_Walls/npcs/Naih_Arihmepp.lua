-----------------------------------
-- Area: Windurst Walls
--  NPC: Naih Arihmepp
-- Type: Standard NPC
-- !pos -64.578 -13.465 202.147 239
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,9) == false) then
        player:startEvent(500);
    else
        player:startEvent(326);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 500) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",9,true);
    end

end;
