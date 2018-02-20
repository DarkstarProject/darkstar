-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Monolith
-- !pos <many>
-----------------------------------
require("scripts/zones/The_Shrine_of_RuAvitau/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - SHRINE_MONOLITH_OFFSET;
    if (offset >= 0 and offset <= 38) then
        local colorTouched = SHRINE_MONOLITHS[offset / 2];
        for i = 0, 21 do
            local anim = SHRINE_DOORS[i] == colorTouched and ANIMATION_OPEN_DOOR or ANIMATION_CLOSE_DOOR;
            GetNPCByID(SHRINE_DOOR_OFFSET + i):setAnimation(anim);
        end
        for i = 0, 19 do
            local anim = SHRINE_MONOLITHS[i] == colorTouched and ANIMATION_OPEN_DOOR or ANIMATION_CLOSE_DOOR;
            GetNPCByID(SHRINE_MONOLITH_OFFSET + (i * 2) - 1):setAnimation(anim);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
