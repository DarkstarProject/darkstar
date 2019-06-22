-----------------------------------------
-- Spell: Knight's Minne V
-- Grants Defense bonus to all allies.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local sLvl = caster:getSkillLevel(dsp.skill.SINGING) -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(dsp.slot.RANGED)

    local power = 50 + math.floor((sLvl + iLvl)/10)

    if (power >= 204) then
        power = 204
    end

    local iBoost = caster:getMod(dsp.mod.MINNE_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
    if (iBoost > 0) then
        power = power + iBoost*20
    end

    power =  power + caster:getMerit(dsp.merit.MINNE_EFFECT)

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(dsp.effect.MARCATO)

    local duration = 120
    duration = duration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster,dsp.effect.MINNE,power,0,duration,caster:getID(), 0, 5)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.MINNE
end
