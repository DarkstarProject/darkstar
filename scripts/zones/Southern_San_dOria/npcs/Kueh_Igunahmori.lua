-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Kueh Igunahmori
-- Guild Merchant NPC: Leathercrafting Guild
-- !pos -194.791 -8.800 13.130 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(529,3,18,4)) then
        player:showText(npc,KUEH_IGUNAHMORI_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;


