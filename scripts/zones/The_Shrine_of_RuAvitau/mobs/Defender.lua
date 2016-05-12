-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Defender
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)

    local Defender = mob:getID();
    GetMobByID(Defender):setLocalVar("1",1);

end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)

    local Defender = mob:getID();
    local AuraGear = Defender + 1;
    local ExtraVar = GetMobByID(Defender):getLocalVar("1");

   -- Summons a Defender every 15 seconds.
   -- TODO: Casting animation for before summons. When he spawns them isn't exactly retail accurate.
   -- Defenders can also still spawn the AuraGears while sleeping, etc.

    if (GetMobAction(AuraGear) == 16) then
        GetMobByID(AuraGear):updateEnmity(target);
    end

    if (ExtraVar <= 6) then  -- Maximum number of pets Defender can spawn is 5
        if (mob:getBattleTime() % 15 < 3 and mob:getBattleTime() > 3) then
            if (GetMobAction(AuraGear) == 0) then
                SpawnMob(AuraGear):updateEnmity(target);
                GetMobByID(AuraGear):setPos(GetMobByID(Defender):getXPos()+1, GetMobByID(Defender):getYPos(), GetMobByID(Defender):getZPos()+1); -- Set AuraGear x and z position +1 from Defender
                GetMobByID(Defender):setLocalVar("1",ExtraVar+1);
                return;
            end
        end
    end

end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)

    local Defender = mob:getID();
    local AuraGear = mob:getID() + 1;

    GetMobByID(Defender):resetLocalVars();

    if (GetMobAction(AuraGear) ~= 0) then
        DespawnMob(AuraGear);
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,749,1);

    local Defender = mob:getID();
    local AuraGear = mob:getID() + 1;

    GetMobByID(Defender):resetLocalVars();

    if (GetMobAction(AuraGear) ~= 0) then
        DespawnMob(AuraGear);
    end

end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )

    local Defender = mob:getID();
    local AuraGear = mob:getID() + 1;

    GetMobByID(Defender):resetLocalVars();

    if (GetMobAction(AuraGear) ~= 0) then
        DespawnMob(AuraGear);
    end

end;