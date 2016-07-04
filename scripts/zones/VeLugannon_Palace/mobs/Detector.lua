-----------------------------------
-- Area: VeLugannon Palace
--  MOB: Detector
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

    local Detector = mob:getID();
    GetMobByID(Detector):setLocalVar("1",1);

end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)

    local Detector = mob:getID();
    local Caretaker = Detector + 1;
    local ExtraVar = GetMobByID(Detector):getLocalVar("1");

   -- Summons a Detector every 15 seconds.
   -- TODO: Casting animation for before summons. When he spawns them isn't exactly retail accurate.
   --       Should be ~10s to start cast, and another ~5 to finish.
   -- Detectors can also still spawn the Caretakers while sleeping, moving, etc.

    if (GetMobAction(Caretaker) == 16) then
        GetMobByID(Caretaker):updateEnmity(target);
    end

    if (ExtraVar <= 6) then  -- Maximum number of pets Detector can spawn is 5
        if (mob:getBattleTime() % 15 < 3 and mob:getBattleTime() > 3) then
            if (GetMobAction(Caretaker) == 0) then
                SpawnMob(Caretaker):updateEnmity(target);
                GetMobByID(Caretaker):setPos(GetMobByID(Detector):getXPos()+1, GetMobByID(Detector):getYPos(), GetMobByID(Detector):getZPos()+1); -- Set Caretaker x and z position +1 from Detector
                GetMobByID(Detector):setLocalVar("1",ExtraVar+1);
                return;
            end
        end
    end

end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob)

    local Detector = mob:getID();
    local Caretaker = mob:getID() + 1;

    GetMobByID(Detector):resetLocalVars();

    if (GetMobAction(Caretaker) ~= 0) then
        DespawnMob(Caretaker);
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,743,1);

    local Detector = mob:getID();
    local Caretaker = mob:getID() + 1;

    GetMobByID(Detector):resetLocalVars();

    if (GetMobAction(Caretaker) ~= 0) then
        DespawnMob(Caretaker);
    end

end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )

    local Detector = mob:getID();
    local Caretaker = mob:getID() + 1;

    GetMobByID(Detector):resetLocalVars();

    if (GetMobAction(Caretaker) ~= 0) then
        DespawnMob(Caretaker);
    end

end;