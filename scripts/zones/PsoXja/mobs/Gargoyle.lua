-----------------------------------
-- Area: Pso'xja
--  MOB: Gargoyle
-----------------------------------
require("scripts/zones/PsoXja/MobIDs");

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        local mobId = mob:getID();
        local offset = mobId - GARGOYLE_OFFSET;
        if (offset < 16) then
            GetNPCByID(STONE_DOOR_OFFSET + offset):openDoor(30);
        end
    end
end;

function onMobDespawn(mob)
end;