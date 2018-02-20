-----------------------------------
-- Area: The Sanctuary of Zitah
--  NPC: ???
-- Finishes Quest: Lovers in the Dusk
-- @zone 121
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/weather");
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local LoversInTheDusk = player:getQuestStatus(BASTOK,LOVERS_IN_THE_DUSK);
    local TOTD = VanadielTOTD();

    if (TOTD == TIME_DUSK and LoversInTheDusk == QUEST_ACCEPTED) then
        player:startEvent(204);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 204) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17346);
        else
            player:addItem(17346);
            player:messageSpecial(ITEM_OBTAINED,17346); -- Siren Flute
            player:addFame(BASTOK,120);
            player:completeQuest(BASTOK,LOVERS_IN_THE_DUSK);
        end
    end
end;