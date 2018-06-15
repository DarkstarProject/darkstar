-----------------------------------
-- Area: Davoi
--  NPC: Storage Hole
-- Involved in Quest: The Crimson Trial
-- !pos -51 4 -217 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,THE_CRIMSON_TRIAL) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1103,1) and trade:getItemCount() == 1) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.ORCISH_DRIED_FOOD);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ORCISH_DRIED_FOOD);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getQuestStatus(SANDORIA,THE_CRIMSON_TRIAL) == QUEST_ACCEPTED) then
        player:messageSpecial(AN_ORCISH_STORAGE_HOLE);
    else
        player:messageSpecial(YOU_SEE_NOTHING);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;