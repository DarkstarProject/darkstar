-----------------------------------
-- Area: West Ronfaure
--  NPC: Adalefont
-- @pos -176.000 -61.999 377.460 100
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

    local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

    if (thePickpocket > 0) then
        player:showText(npc, text.7265);
    else
        player:showText(npc, text.ADALEFONT_DIALOG);
    end
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



