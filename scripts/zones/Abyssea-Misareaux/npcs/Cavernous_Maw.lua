-----------------------------------
-- Area: Abyssea - Misareaux
--  NPC: Cavernous Maw
-- @pos 676.070, -16.063, 318.999 216
-- Teleports Players to Valkrum Dunes
-----------------------------------

require("scripts/globals/settings");
local text = require("scripts/zones/Abyssea-Misareaux/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x00C8);
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
    if (csid == 0x00C8 and option ==1) then
        player:setPos(362,0.001,-119,4,103);
    end
end;
