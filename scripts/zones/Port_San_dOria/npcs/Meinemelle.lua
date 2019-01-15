-----------------------------------
-- Area: Port San d'Oria
--   NPC: Meinemelle
-- Type: Standard NPC
-- !pos -8.289 -9.3 -146.093 232
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if player:getVar("thePickpocket") == 1 and not player:getMaskBit(player:getVar("[pickpocket]skipNPC"), 0) then
        player:showText(npc, ID.text.PICKPOCKET_MEINEMELLE)
        player:setMaskBit(player:getVar("[pickpocket]skipNPC"), "[pickpocket]skipNPC", 0, true)
    else
        player:showText(npc, ID.text.ITEM_DELIVERY_DIALOG);
        player:openSendBox();
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
