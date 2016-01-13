-----------------------------------
-- Area: West Ronfaure
--  NPC: Gachemage
-- Type: Gate Guard
-- @pos -176.000 -61.999 382.425 100
-----------------------------------

require("scripts/globals/settings");
local text = require("scripts/zones/West_Ronfaure/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc, text.GACHEMAGE_DIALOG);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
end;



