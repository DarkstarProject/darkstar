-----------------------------------
-- Area: Den of Rancor
--  NPC: Drop Gate
-- @pos -60 46 32 160
-----------------------------------

local text = require("scripts/zones/Den_of_Rancor/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(text.LANTERN_OFFSET); -- The grating will not budge.
    return 1;
end;