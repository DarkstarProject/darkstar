-----------------------------------
-- Area: Dynamis Jeuno
--  NPC: Vanguard Necromancer
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    local mobPet = mob:getID() + 1;

    if (GetMobAction(mobPet) ~= 0) then
        GetMobByID(mobPet):setHP(0);
    end

end;