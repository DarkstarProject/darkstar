-----------------------------------
-- Area: The Eldieme Necropolis [S]
--  NPC:  Turbulent Storm
-- Note: Starts Quest "The Fighting Fourth"
-- @pos 422.461 -48.000 175
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCampaignAllegiance() > 0) then
        if (player:getCampaignAllegiance() == 2) then
            player:startEvent(9);
        else
            -- message for other nations missing
            player:startEvent(9);
        end
    elseif (player:hasKeyItem(RED_RECOMMENDATION_LETTER) == true) then
        player:startEvent(8);
    elseif (player:hasKeyItem(RED_RECOMMENDATION_LETTER) == false) then
        player:startEvent(7);
    end
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0007 and option == 0) then
        player:addKeyItem(BLUE_RECOMMENDATION_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED,BLUE_RECOMMENDATION_LETTER);
    end
end;