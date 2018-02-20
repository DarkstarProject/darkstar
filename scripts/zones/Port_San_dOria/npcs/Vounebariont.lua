-----------------------------------
-- Area: Port San d'Oria
--  NPC: Vounebariont
-- Starts and Finishes Quest: Thick Shells
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,THICK_SHELLS) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(889,5) and trade:getItemCount() == 5) then -- Trade Beetle Shell
            player:startEvent(514);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getFameLevel(SANDORIA) >= 2) then
        player:startEvent(516);
    else
        player:startEvent(568);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 516) then
        if (player:getQuestStatus(SANDORIA,THICK_SHELLS) == QUEST_AVAILABLE) then
            player:addQuest(SANDORIA,THICK_SHELLS);
        end
    elseif (csid == 514) then
        if (player:getQuestStatus(SANDORIA,THICK_SHELLS) == QUEST_ACCEPTED) then
            player:completeQuest(SANDORIA,THICK_SHELLS);
            player:addFame(SANDORIA,30);
        else
            player:addFame(SANDORIA,5);
        end

        player:tradeComplete();
        player:addTitle(BUG_CATCHER);
        player:addGil(GIL_RATE*750);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*750)
    end

end;