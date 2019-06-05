-----------------------------------
-- Area: East Ronfaure
--  NPC: Cavernous Maw
-- !pos 322 -59 503 101
-- Teleports Players to East Ronfaure [S]
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
local ID = require("scripts/zones/East_Ronfaure/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (ENABLE_WOTG == 1 and player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER) and hasMawActivated(player,6)) then
        player:startEvent(904);
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 904 and option == 1) then
        dsp.teleport.toMaw(player,9);
    end
end;