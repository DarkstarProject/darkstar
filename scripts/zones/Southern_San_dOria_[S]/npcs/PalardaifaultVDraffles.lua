-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Palardaifault V Draffles
-- @zone 80
-- @pos 9 1 -35
local text = require("scripts/zones/Southern_San_dOria_[S]/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc, text.11024); -- Greetings, I am Curate Palardaifaut, and I have been assigned to the Knights of the Iron Ram to ensure that its members stray not from the path of the Goddess.
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