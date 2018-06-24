-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Chaupire
-- Guild Merchant NPC: Woodworking Guild
-- !pos -174.476 3.999 281.854 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(5132,6,21,0)) then
        player:showText(npc,CHAUPIRE_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;


