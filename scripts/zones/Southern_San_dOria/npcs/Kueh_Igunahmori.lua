-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Kueh Igunahmori
-- Guild Merchant NPC: Leathercrafting Guild 
-- @pos -194.791 -8.800 13.130 230
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/conquest");
local text = require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:sendGuild(529,3,18,4)) then
        player:showText(npc, text.KUEH_IGUNAHMORI_DIALOG);
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

