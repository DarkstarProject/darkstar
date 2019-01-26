-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Lucretia
--  Guild Merchant NPC: Blacksmithing Guild
-- !pos -193.729 3.999 159.412 231
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
local ID = require("scripts/zones/Northern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(5312,8,23,2)) then
        player:showText(npc,ID.text.LUCRETIA_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
