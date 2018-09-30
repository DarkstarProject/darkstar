-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Shiva's Gate
-- !pos 270 -34 100 195
-----------------------------------
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (npc:getAnimation() == 9) then
        if (player:hasKeyItem(dsp.ki.MAGICKED_ASTROLABE)) then
            npc:openDoor(8);
        else
            player:messageSpecial(ID.text.SOLID_STONE);
        end
    end
    return 0;
end;
--
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;