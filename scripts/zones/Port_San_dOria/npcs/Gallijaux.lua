-----------------------------------
-- Area: Port San d'Oria
--  NPC: Gallijaux
--  Starts The Rivalry
-- !pos -14 -2 -45 232
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/npc_util");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onSpawn(npc)
    npcUtil.fishingAnimation(npc, 2)
end;

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    local MoatCarp = trade:getItemQty(4401)
    local ForestCarp = trade:getItemQty(4289)
    local fishCountVar = player:getVar("theCompetitionFishCountVar");
    local totalFish = MoatCarp + ForestCarp + fishCountVar;

    if (MoatCarp + ForestCarp > 0 and MoatCarp + ForestCarp == count) then
        if (player:getQuestStatus(SANDORIA,THE_RIVALRY) == QUEST_ACCEPTED and totalFish >= 10000) then -- ultimate reward
            player:tradeComplete();
            player:addFame(SANDORIA,30);
            player:addGil((GIL_RATE*10*MoatCarp) + (GIL_RATE*15*ForestCarp));
            player:messageSpecial(GIL_OBTAINED,MoatCarp*10 + ForestCarp*15);
            player:startEvent(303);
        elseif (player:getQuestStatus(SANDORIA,THE_RIVALRY) >= QUEST_ACCEPTED) then -- regular turn-ins. Still allowed after completion of the quest.
            player:tradeComplete();
            player:addFame(SANDORIA,30);
            player:addGil((GIL_RATE*10*MoatCarp) + (GIL_RATE*15*ForestCarp));
            player:setVar("theCompetitionFishCountVar",totalFish);
            player:startEvent(301);
            player:messageSpecial(GIL_OBTAINED,MoatCarp*10 + ForestCarp*15);
        else
            player:startEvent(302);
        end
    end
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(SANDORIA,THE_COMPETITION) == QUEST_AVAILABLE and player:getQuestStatus(SANDORIA,THE_RIVALRY) == QUEST_AVAILABLE) then -- If you haven't started either quest yet
        player:startEvent(300, 4401, 4289); -- 4401 = Moat Carp, 4289 = Forest Carp
    elseif (player:getQuestStatus(SANDORIA,THE_RIVALRY) == QUEST_ACCEPTED) then
        player:messageSpecial(GALLIJAUX_CARP_STATUS, 0, player:getVar("theCompetitionFishCountVar"), 0, 0, true);
    elseif ((player:getQuestStatus(SANDORIA,THE_COMPETITION)) == QUEST_ACCEPTED) then
        player:messageSpecial(GALLIJAUX_HELP_OTHER_BROTHER, 0, 0, 0, 0, true);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 303) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17386);
        else
            player:tradeComplete();
            player:addItem(17386);
            player:messageSpecial(ITEM_OBTAINED, 17386);
            player:addTitle(CARP_DIEM);
            player:addKeyItem(TESTIMONIAL);
            player:messageSpecial(KEYITEM_OBTAINED,TESTIMONIAL);
            player:setVar("theCompetitionFishCountVar",0);
            player:completeQuest(SANDORIA,THE_RIVALRY);
        end
    elseif (csid == 300 and option == 700) then
        player:addQuest(SANDORIA,THE_RIVALRY);
    end
end;
