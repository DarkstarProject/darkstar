-----------------------------------
-- Area: Beadeaux [S] (92)
--  NM:  Da'Dha Hundredmask
-- !spawnmob 17154195
-- !pos -89.901 .225 -159.694 92
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("HpTrigger", math.random(5,65));
    mob:setMod(MOD_TRIPLE_ATTACK, 25);
    mob:addMod(MOD_GRAVITYRES, 50);
end;

function onMobFight( mob, target )
    if (mob:getHPP() < mob:getLocalVar("HpTrigger") and mob:getLocalVar("perfect_dodge") == 0) then
        mob:useMobAbility(1013);
        mob:setLocalVar("perfect_dodge", 1);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
