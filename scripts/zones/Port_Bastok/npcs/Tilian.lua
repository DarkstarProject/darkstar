-----------------------------------
-- Area: Port Bastok
--  NPC: Tilian
-- Type: Quest NPC
-- !pos -118.460 4.999 -68.090 236
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,4) == false) then
        player:startEvent(353);
    else
        player:startEvent(100);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 353) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",4,true);
    end
end;
