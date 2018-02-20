-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: ??? Used for Norg quest "The Sahagin's Stash"
-- @zone 176
-- !pos 295.276 27.129 213.043
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    SahaginStash = player:getQuestStatus(OUTLANDS,THE_SAHAGINS_STASH);

    if (SahaginStash == QUEST_ACCEPTED and player:hasKeyItem(296) == false) then
        player:startEvent(1);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
        if (csid == 1) then
            player:addKeyItem(296);
            player:messageSpecial(KEYITEM_OBTAINED,296);
        end
end;