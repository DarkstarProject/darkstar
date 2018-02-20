-----------------------------------
-- Area: Windurst Waters
--  NPC: Cochal-Monchal
-- Involved in Quest: Dark Legacy
-- @zone 238
-- !pos -52 -6 110
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getVar("darkLegacyCS") == 2) then
        player:startEvent(697,0,DARKSTEEL_FORMULA);
    elseif (player:getVar("darkLegacyCS") == 3) then
        player:startEvent(698,0,DARKSTEEL_FORMULA);
    elseif (player:hasKeyItem(DARKSTEEL_FORMULA)) then
        player:startEvent(699,0,DARKSTEEL_FORMULA);
    else
        player:startEvent(696);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 697) then
        player:setVar("darkLegacyCS",3);
        player:delKeyItem(LETTER_FROM_THE_DARKSTEEL_FORGE);
    end

end;