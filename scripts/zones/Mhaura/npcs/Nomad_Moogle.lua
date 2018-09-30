-----------------------------------
-- Area: Mhaura
--  NPC: Nomad Moogle
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,ID.text.NOMAD_MOOGLE_DIALOG);
    player:sendMenu(1);
end;

function onEventUpdate(player,csid,option)
    -- printf("onEventUpdate");
end;

function onEventFinish(player,csid,option)
    -- printf("onEventFinish");
end;
