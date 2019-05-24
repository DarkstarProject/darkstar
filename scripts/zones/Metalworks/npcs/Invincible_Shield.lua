-----------------------------------
-- Area: Metalworks
--  NPC: Invincible Shield
-- Type: Ballista
-- !pos -51.083 -11 2.126 237
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,6) == false) then
        player:startEvent(932);
    else
        player:startEvent(810);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 932) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",6,true);
    end

end;
