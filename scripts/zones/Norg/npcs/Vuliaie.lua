-----------------------------------
-- Area: Norg
--  NPC: Vuliaie
-- Type: Tenshodo Merchant
-- !pos -24.259 0.891 -19.556 252
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
    if (player:hasKeyItem(TENSHODO_MEMBERS_CARD)) then
        if (player:sendGuild(60424,9,23,7)) then
            player:showText(npc, VULIAIE_SHOP_DIALOG);
        end
    else
        -- player:startEvent(150);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

