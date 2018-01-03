-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Bomb Bastard
-----------------------------------

require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_EXP_BONUS, -100);
    mob:setMobMod(MOBMOD_GIL_BONUS, -100);
    mob:setMobMod(MOBMOD_NO_DROPS, 1);
end;

function onMobSpawn(mob)
    mob:addMod(MOD_STUNRES, 50);
end;

function onMobFight(mob,target)
    if (mob:getBattleTime() > 10) then
        mob:useMobAbility(511);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
