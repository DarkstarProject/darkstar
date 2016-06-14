-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Vanguard Necromancer
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    local mobPet = mob:getID() + 1;

    if (GetMobAction(mobPet) ~= 0) then
        GetMobByID(mobPet):setHP(0);
    end

end;