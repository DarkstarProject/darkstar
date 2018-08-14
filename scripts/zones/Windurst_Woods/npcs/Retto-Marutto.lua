-----------------------------------
-- Area: Windurst Woods
--  NPC: Retto-Marutto
-- Guild Merchant NPC: Bonecrafting Guild
-- !pos -6.142 -6.55 -132.639 241
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
    if (player:sendGuild(5142,8,23,3)) then
        player:showText(npc,RETTO_MARUTTO_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

