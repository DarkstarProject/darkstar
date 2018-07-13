-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Leviathan's Gate
-- !pos 249 -34 -60 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (npc:getAnimation() == 9) then
        if (player:hasKeyItem(dsp.ki.MAGICKED_ASTROLABE)) then
            npc:openDoor(8);
        else
            player:messageSpecial(SOLID_STONE);
        end
    end
    return 0;
end;
--
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;