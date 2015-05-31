-----------------------------------
-- Area: Al'Taieu
--  NM:  Jailer of Prudence
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;
-----------------------------------
-- onMobDisEngage Action
-----------------------------------

function onMobDisEngage(mob, target)
end;
-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local BattleTime = mob:getBattleTime();
    local JoP_2hr_Used =  mob:getLocalVar("JoP_2hr");

    if (mob:getHPP() <= 10) then
        if (JoP_2hr_Used == 3) then
            mob:useMobAbility(437);
            mob:setLocalVar("JoP_2hr", 4);
        end
    elseif (mob:getHPP() <= 25) then
        if (JoP_2hr_Used == 2) then
            mob:useMobAbility(437);
            mob:setLocalVar("JoP_2hr", 3);
        end
    elseif (mob:getHPP() <= 50) then
        if (JoP_2hr_Used == 1) then
            mob:useMobAbility(437);
            mob:setLocalVar("JoP_2hr", 2);
        end
    elseif (mob:getHPP() <= 75) then
        if (JoP_2hr_Used == 0) then
            mob:useMobAbility(437);
            mob:setLocalVar("JoP_2hr", 1);
        end
    end

end;
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;