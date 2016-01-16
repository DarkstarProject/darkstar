-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Tungs'Iton
-- Zilart Mission 4 BCNM Fight
-----------------------------------

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

function onMobDeath(mob,killer,ally)
    local elemental = mob:getID()+1;
    local kills = ally:getVar("EVERYONES_GRUDGE_KILLS");

    if (kills < 480) then
        ally:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end

    if (GetMobAction(elemental) ~= 0) then
        DespawnMob(elemental);
    end

end;