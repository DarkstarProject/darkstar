-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  Monolith
-----------------------------------
require("scripts/zones/VeLugannon_Palace/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - YELLOW_MONOLITH_OFFSET;
    if (offset >= 0 and offset <= 20) then
        local y = (offset <= 11) and ANIMATION_OPEN_DOOR or ANIMATION_CLOSE_DOOR;
        local b = (offset <= 11) and ANIMATION_CLOSE_DOOR or ANIMATION_OPEN_DOOR;
        for i = YELLOW_CERMET_DOOR_OFFSET, YELLOW_CERMET_DOOR_OFFSET +  7, 1 do GetNPCByID(i):setAnimation(y); end -- yellow doors
        for i = BLUE_CERMET_DOOR_OFFSET  , BLUE_CERMET_DOOR_OFFSET   +  6, 1 do GetNPCByID(i):setAnimation(b); end -- blue doors
        for i = YELLOW_MONOLITH_OFFSET -1, YELLOW_MONOLITH_OFFSET    +  9, 2 do GetNPCByID(i):setAnimation(y); end -- yellow monoliths
        for i = BLUE_MONOLITH_OFFSET   -1, BLUE_MONOLITH_OFFSET      +  9, 2 do GetNPCByID(i):setAnimation(b); end -- blue monoliths
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
