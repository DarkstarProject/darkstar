-----------------------------------
-- Area: Beadeaux
--  NPC: Jail Door
-- Involved in Quests: The Rescue
-- !pos 56 0.1 -23 147
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Beadeaux/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OTHER_AREAS,THE_RESCUE) == QUEST_ACCEPTED and player:hasKeyItem(TRADERS_SACK) == false) then
        if (trade:hasItemQty(495,1) == true and trade:getItemCount() == 1) then
            player:startEvent(1000);
        end
    end
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(OTHER_AREAS,THE_RESCUE) == QUEST_ACCEPTED and player:hasKeyItem(TRADERS_SACK) == false) then
        player:messageSpecial(LOCKED_DOOR_QUADAV_HAS_KEY);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 1000) then
        player:addKeyItem(TRADERS_SACK);
        player:messageSpecial(KEYITEM_OBTAINED,TRADERS_SACK);
    end
end;

