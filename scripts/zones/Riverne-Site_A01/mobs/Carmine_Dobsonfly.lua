-----------------------------------
-- Area: Riverne Site A01
--  MOB: Carmine Dobsonfly
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, 16900230); -- mobID of the first one
    mob:SetMagicCastingEnabled(false); -- does not cast spells while idle
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    mob:SetMagicCastingEnabled(true);
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)
    mob:SetMagicCastingEnabled(false);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local firstDobsonfly = 16900230;
    local mobID = mob:getID();
    local carminesKilled = GetServerVariable("[NM]Carmine_Dobsonflies_Killed");

    if (bit.band(carminesKilled, bit.lshift(1, (mobID - firstDobsonfly))) == 0) then
        carminesKilled = bit.bor(carminesKilled, bit.lshift(1, (mobID - firstDobsonfly)));
        if (carminesKilled == 1023) then -- all have been defeated, allow for them to respawn while setting their respawn time to be all the same
            local respawnTime = math.random(75600,86400);
            for  i = firstDobsonfly, firstDobsonfly + 9, 1 do    
                DeterMob(i, false);
                GetMobByID(i):setRespawnTime(respawnTime);
            end
            carminesKilled = 0; -- clear the server var
        else -- prevent them from respawning
            DeterMob(mobID, true);
        end
        SetServerVariable("[NM]Carmine_Dobsonflies_Killed", carminesKilled);
    end
end;