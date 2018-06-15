-----------------------------------
-- Area: Selbina
--  NPC: Gabwaleid
-- Involved in Quest: Riding on the Clouds
-- !pos -17 -7 11 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_3") == 4) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_3",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SOMBER_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SOMBER_STONE);
        end
    end

end;

function onTrigger(player,npc)
    player:startEvent(600);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;