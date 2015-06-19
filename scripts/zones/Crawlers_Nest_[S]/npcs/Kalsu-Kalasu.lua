-----------------------------------
-- Area: Crawlers Nest [S]
--  NPC: Kalsu-Kalasu
-- @pos 304.768 -33.519 -19.168 171
-- Notes: Gives Green Letter required to start "Snake on the plains"
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Crawlers_Nest_[S]/TextIDs");

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
            player:startEvent(3);
        else
            -- message for other nations missing
            player:startEvent(3);
        end
    elseif (player:hasKeyItem(GREEN_RECOMMENDATION_LETTER) == true) then
        player:startEvent(0x0002);
    elseif (player:hasKeyItem(GREEN_RECOMMENDATION_LETTER) == false) then
        player:startEvent(0x0001);
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
    if (csid == 0x0001 and option == 0) then
        player:addKeyItem(GREEN_RECOMMENDATION_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED, GREEN_RECOMMENDATION_LETTER);
    end
end;