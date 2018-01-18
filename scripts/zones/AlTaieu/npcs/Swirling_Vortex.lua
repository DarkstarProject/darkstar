-----------------------------------
-- Area: Al'Taieu
--  NPC: Swirling_Vortex
-- Type: Standard NPC
-- !pos ? ? ? 33
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs");
require("scripts/zones/AlTaieu/MobIDs");
require("scripts/globals/limbus");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - SWIRLING_VORTEX_OFFSET;
    if (offset >= 0 and offset <= 1) then
        player:startEvent(159 + offset);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 160 and option == 1 ) then
        ResetPlayerLimbusVariable(player);
        LimbusEntrance(player,APPOLLYON_NW_SW);
    elseif (csid == 159 and option == 1 ) then
        ResetPlayerLimbusVariable(player);
        LimbusEntrance(player,APPOLLYON_SE_NE);
    end
end;
