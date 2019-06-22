-----------------------------------
-- Area: Port Bastok
--  NPC: Gudav
-- Starts Quests: A Foreman's Best Friend
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Port_Bastok/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(13096,1) and trade:getItemCount() == 1) then
        if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.A_FOREMAN_S_BEST_FRIEND) == QUEST_ACCEPTED) then
            player:tradeComplete();
            player:startEvent(112);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getMainLvl() >= 7 and player:getQuestStatus(BASTOK,dsp.quest.id.bastok.A_FOREMAN_S_BEST_FRIEND) == QUEST_AVAILABLE) then
        player:startEvent(110);
    else
        player:startEvent(31);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)

    if (csid == 110) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.A_FOREMAN_S_BEST_FRIEND);
    elseif (csid == 112) then
        if (player:hasKeyItem(dsp.ki.MAP_OF_THE_GUSGEN_MINES) == false) then
            player:addKeyItem(dsp.ki.MAP_OF_THE_GUSGEN_MINES);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MAP_OF_THE_GUSGEN_MINES);
        end
        player:addFame(BASTOK,60);
        player:completeQuest(BASTOK,dsp.quest.id.bastok.A_FOREMAN_S_BEST_FRIEND);
    end

end;