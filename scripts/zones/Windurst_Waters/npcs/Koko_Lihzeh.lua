-----------------------------------
-- Area: Windurst Waters
--  NPC: Koko Lihzeh
-- Involved in Quest: Making the Grade, Riding on the Clouds
-- !pos 135 -6 162 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 1) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_4",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SPIRITED_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SPIRITED_STONE);
        end
    end

end;

function onTrigger(player,npc)
    if (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
        player:startEvent(451); -- During Making the GRADE
    else
        player:startEvent(428); -- Standard conversation
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;