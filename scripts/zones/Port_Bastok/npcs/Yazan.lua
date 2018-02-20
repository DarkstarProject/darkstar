-----------------------------------
-- Area: Port Bastok
--  NPC: Yazan
-- Starts Quests: Bite the Dust (100%)
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
------------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    BiteDust = player:getQuestStatus(BASTOK,BITE_THE_DUST);

    if (BiteDust ~= QUEST_AVAILABLE and trade:hasItemQty(1015,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        player:startEvent(193);
    end

end;

function onTrigger(player,npc)

    BiteDust = player:getQuestStatus(BASTOK,BITE_THE_DUST);

    if (BiteDust == QUEST_AVAILABLE) then
        player:startEvent(191);
    elseif (BiteDust == QUEST_ACCEPTED) then
        player:startEvent(192);
    else
        player:startEvent(190);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 191) then
        player:addQuest(BASTOK,BITE_THE_DUST);
    elseif (csid == 193) then
        if (player:getQuestStatus(BASTOK,BITE_THE_DUST) == QUEST_ACCEPTED) then
            player:addTitle(SAND_BLASTER)
            player:addFame(BASTOK,120);
            player:completeQuest(BASTOK,BITE_THE_DUST);
        else
            player:addFame(BASTOK,80);
        end

        player:addGil(GIL_RATE*350);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
    end

end;