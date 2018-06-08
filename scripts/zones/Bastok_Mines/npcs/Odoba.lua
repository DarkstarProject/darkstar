-----------------------------------
-- Area: Bastok Mines
--  NPC: Odoba
-- Guild Merchant NPC: Alchemy Guild
-- !pos 108.473 5.017 1.089 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(526,8,23,6)) then
        player:showText(npc, ODOBA_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

