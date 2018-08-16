-----------------------------------
-- Area: Full Moon Fountain
-- Windurst Mission 9-2
-----------------------------------
require("scripts/zones/Full_Moon_Fountain/MobIDs");

function allMoonMobsDead(player)
    local inst = player:getBattlefield():getBattlefieldNumber();
    local instOffset = MOON_READING_OFFSET + (6 * (inst - 1));
    for i = instOffset, instOffset + 3 do
        if (not GetMobByID(i):isDead()) then
            return false;
        end
    end
    return true;
end;

function onMobDeath(mob, player, isKiller)
    if (allMoonMobsDead(player)) then
        player:release(); -- prevents event collision if player kills multiple remaining mobs with an AOE move/spell
        player:startEvent(32004,1,0,1,0,1);
    end
end;