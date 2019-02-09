-----------------------------------
-- Area: Bastok Markets
--  NPC: Teerth
--  Guild Merchant NPC: Goldsmithing Guild
-- !zone
-- !pos -205.190 -7.814 -56.507 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:sendGuild(527,8,23,4)) then
        player:showText(npc,ID.text.TEERTH_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
