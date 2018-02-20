-----------------------------------
-- Area: Xarcabard
--  NPC: qm6 (???)
-- Involved in Quests: RNG AF3 - Unbridled Passion
-- !pos -254.883 -17.003 -150.818 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Xarcabard/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local UnbridledPassionCS = player:getVar("unbridledPassion");

    if (UnbridledPassionCS == 5) then
        player:startEvent(6, 0, 13360);
    elseif (UnbridledPassionCS == 6) then
        player:startEvent(7);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 6) then
        player:setVar("unbridledPassion",6);
    elseif (csid == 7) then
        local iceArrow = 17323;
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, iceArrow);
        else
            player:addItem(iceArrow, 99);
            player:messageSpecial(ITEM_OBTAINED, iceArrow);
            player:setVar("unbridledPassion", 7);
        end;
    end;
end;