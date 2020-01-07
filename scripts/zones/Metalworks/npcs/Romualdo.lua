-----------------------------------
-- Area: Metalworks
--  NPC: Romualdo
-- Involved in Quest: Stamp Hunt
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local StampHunt = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.STAMP_HUNT);

    if (StampHunt == QUEST_ACCEPTED and player:getMaskBit(player:getCharVar("StampHunt_Mask"),4) == false) then
        player:startEvent(726);
    else
        player:startEvent(705);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 726) then
        player:setMaskBit(player:getCharVar("StampHunt_Mask"),"StampHunt_Mask",4,true);
    end

end;
