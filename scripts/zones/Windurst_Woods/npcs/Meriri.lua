-----------------------------------
-- Area: Windurst Woods
--  NPC: Meriri
-- Guild Merchant NPC: Clothcrafting Guild
-- !pos -76.471 -3.55 -128.341 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(515,6,21,0)) then
        player:showText(npc,MERIRI_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

