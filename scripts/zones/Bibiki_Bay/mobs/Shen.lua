-----------------------------------
-- Area: Bibiki Bay
--  MOB: Shen
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

    local Shen = mob:getID();

    if (mob:getBattleTime() % 45 == 0) then
        if (GetMobAction(Shen+1) == 0) then
            SpawnMob(Shen+1,300):updateEnmity(target);
        elseif (GetMobAction(Shen+2) == 0) then
            SpawnMob(Shen+2,300):updateEnmity(target);
        end
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMonsterMagicPrepare
-----------------------------------

function onMonsterMagicPrepare(mob,target)

    -- casts Water IV, Waterga III, Flood, Drown
    rnd = math.random();

    if (rnd < 0.5) then
        return 201; -- waterga 3
    elseif (rnd < 0.7) then
         return 172; -- water 4
    elseif (rnd < 0.9) then
        return 214; -- flood
    else
        return 240; -- drown
    end

end;