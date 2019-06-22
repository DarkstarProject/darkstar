-----------------------------------
-- Area: Bastok Markets
--  NPC: Ken
-- Type: Quest NPC
-- !pos -340.857 -11.003 -149.008 235
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,13) == false) then
        player:startEvent(432);
    else
        player:startEvent(361);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 432) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",13,true);
    end

end;
