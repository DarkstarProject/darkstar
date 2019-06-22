-----------------------------------
-- Area: Chamber of Oracles
-- MOB: Nanaa Mihgo
-- AMK 10 BCNM
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Chamber_of_Oracles/IDs")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:addMod(dsp.mod.TRIPLE_ATTACK, 30)
    mob:addMod(dsp.mod.REGEN, 100)
    dsp.mix.jobSpecial.config(mob, {
    specials =
        {
            {
                id = dsp.jsa.PERFECT_DODGE,
                begCode = function(mob)
                    mob:messageText(mob, ID.text.I_CANT_BREAK_OUT_MOVES_LIKE_THIS)
                end,
            },
        },
    })
end

function onMobWeaponSkill(target, mob, skill)
    mob:messageText(mob, ID.text.TIME_FOR_THE_CAT_BURGLAR_TO)
end

function onMobFight(mob,target)
    local cha = mob:getID() + 1
    local bopa = mob:getID() + 2

    if mob:getHPP() < 70 and mob:getLocalVar("cha_spawned") == 0 then
        mob:messageText(mob, ID.text.CHA_SHOW_EM_WHAT_YOUVE_GOT)
        SpawnMob(cha):updateEnmity(target)
        mob:setLocalVar("cha_spawned", 1)
    elseif mob:getHPP() < 60 and mob:getLocalVar("bopa_spawned") == 0 then
        mob:messageText(mob, ID.text.BOPA_A_LITTLE_HELP_HERE)
        SpawnMob(bopa):updateEnmity(target)
        mob:setLocalVar("bopa_spawned", 1)
    end
end

function onAdditionalEffect(mob, target, damage)
    local effects = { dsp.mob.ae.PARALYZE, dsp.mob.ae.SILENCE, dsp.mob.ae.STUN, dsp.mob.ae.POISON }
    local randomEffect = effects[math.random(#effects)]
    return dsp.mob.onAddEffect(mob, target, damage, randomEffect)
end

function onMobDeath(mob, player, isKiller)
    mob:messageText(mob, ID.text.GRR_BAH_IVE_EARNED_MY_PAY)
end
