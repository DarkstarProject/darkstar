-----------------------------------
-- Area: Windurst Woods
--  NPC: Sola Jaab
-- Involved in Quest: Riding on the Clouds
-- !pos 109 -5 -25 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 7) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_4",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SPIRITED_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SPIRITED_STONE);
        end
    end

end;

function onTrigger(player,npc)

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;