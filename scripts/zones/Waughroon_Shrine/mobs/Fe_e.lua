-----------------------------------
-- Area: Waughroon Shrine
--  MOB: fe_e
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

    local hpp = mob:getHPP();

    if hpp < 14 then
        mob:setDelay(2700);
    elseif hpp < 28 then
        mob:setDelay(2350);
    elseif hpp < 42 then
        mob:setDelay(2000);
    elseif hpp < 56 then
        mob:setDelay(1650);
    elseif hpp < 70 then
        mob:setDelay(1300);
    elseif hpp < 84 then
        mob:setDelay(950);
    else
        mob:setDelay(600);
    end

end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
