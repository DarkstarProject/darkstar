-----------------------------------
-- Area: Selbina
--  NPC: Graegham
-- Guild Merchant NPC: Fishing Guild
-- !pos -12.423 -7.287 8.665 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Selbina/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(5182,3,18,5)) then
        player:showText(npc,FISHING_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

