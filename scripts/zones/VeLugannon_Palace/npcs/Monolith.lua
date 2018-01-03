-----------------------------------
-- Area: VeLugannon Palace
-- NPC:  Monolith
-----------------------------------
require("scripts/zones/VeLugannon_Palace/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - VELUGANNON_Y_LITH_OFFSET;
    if (offset >= 0 and offset <= 20) then
        local y = (offset <= 11) and ANIMATION_OPEN_DOOR or ANIMATION_CLOSE_DOOR;
        local b = (offset <= 11) and ANIMATION_CLOSE_DOOR or ANIMATION_OPEN_DOOR;
        for i = VELUGANNON_Y_DOOR_OFFSET,    VELUGANNON_Y_DOOR_OFFSET + 7, 1 do GetNPCByID(i):setAnimation(y); end  -- yellow doors
        for i = VELUGANNON_B_DOOR_OFFSET,    VELUGANNON_B_DOOR_OFFSET + 6, 1 do GetNPCByID(i):setAnimation(b); end  -- blue doors
        for i = VELUGANNON_Y_LITH_OFFSET -1, VELUGANNON_Y_LITH_OFFSET + 9, 2 do GetNPCByID(i):setAnimation(y); end  -- yellow monoliths
        for i = VELUGANNON_B_LITH_OFFSET -1, VELUGANNON_B_LITH_OFFSET + 9, 2 do GetNPCByID(i):setAnimation(b); end  -- blue monoliths
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
