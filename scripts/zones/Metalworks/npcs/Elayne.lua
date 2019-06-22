-----------------------------------
-- Area: Metalworks
--  NPC: Elayne
-- Involved in Quest: Stamp Hunt
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local StampHunt = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.STAMP_HUNT);

    if (StampHunt == QUEST_ACCEPTED and player:getMaskBit(player:getVar("StampHunt_Mask"),3) == false) then
        player:startEvent(725);
    else
        player:startEvent(704);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 725) then
        player:setMaskBit(player:getVar("StampHunt_Mask"),"StampHunt_Mask",3,true);
    end

end;
