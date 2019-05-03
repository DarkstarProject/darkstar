-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Bomb Princess
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
    mob:setMobMod(dsp.mobMod.GIL_BONUS, -100)
    mob:setMobMod(dsp.mobMod.NO_DROPS, 1)
    mob:setMod(dsp.mod.STUNRES, 50)
end

function onMobFight(mob, target)
    if mob:getBattleTime() > 10 then
        mob:useMobAbility(511)
    end
end

function onMobDeath(mob, player, isKiller)
end
