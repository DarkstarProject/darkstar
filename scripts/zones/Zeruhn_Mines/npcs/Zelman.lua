-----------------------------------
-- Area: Zeruhn Mines
--  NPC: Zelman
-- Involved In Quest: Groceries
-- !pos 17.095 7.704 -52.995 172
-----------------------------------
package.loaded["scripts/zones/Zeruhn_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Zeruhn_Mines/TextIDs");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local groceries = player:getVar("Groceries");

    -- GROCERIES
    if (groceries == 1) then
        if (player:seenKeyItem(TAMIS_NOTE)) then
            player:startEvent(162);
        else
            player:startEvent(161);
        end
    elseif (groceries >= 2) then
        player:showText(npc,ZELMAN_CANT_RUN_AROUND);

    -- DEFAULT DIALOG
    else
        player:startEvent(160);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- GROCERIES
    if (csid == 161) then
        player:setVar("Groceries",2);
        player:delKeyItem(TAMIS_NOTE);
    elseif (csid == 162) then
        player:setVar("Groceries",3);
        player:delKeyItem(TAMIS_NOTE);
    end
end;
