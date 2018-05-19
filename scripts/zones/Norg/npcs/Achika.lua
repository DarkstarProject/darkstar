-----------------------------------
-- Area: Norg
--  NPC: Achika
-- Type: Tenshodo Merchant
-- !pos 1.300 0.000 19.259 252
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/keyitems");
require("scripts/zones/Norg/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.TENSHODO_MEMBERS_CARD)) then
        if (player:sendGuild(60421,9,23,7)) then
            player:showText(npc, ACHIKA_SHOP_DIALOG);
        end
    else
        -- player:startEvent(150);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

