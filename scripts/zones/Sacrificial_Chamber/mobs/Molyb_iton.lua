-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Molyb'Iton
-- Zilart Mission 4 BCNM Fight
----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    local mobid = mob:getID();

    for i=mobid-1,mobid+2 do
        GetMobByID(i):updateEnmity(target);
    end
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local kills = player:getVar("EVERYONES_GRUDGE_KILLS");

    if (kills < 480) then
        player:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end

end;