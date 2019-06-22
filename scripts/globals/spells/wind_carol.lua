-----------------------------------------
-- Spell: Wind Carol
-- Increases wind resistance for party members within the area of effect.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local sLvl = caster:getSkillLevel(dsp.skill.SINGING) -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(dsp.slot.RANGED)

    local power = 20

    if (sLvl+iLvl > 200) then
        power = power + math.floor((sLvl+iLvl-200) / 10)
    end

    if (power >= 80) then
        power = 80
    end

    local iBoost = caster:getMod(dsp.mod.CAROL_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
    power = power + iBoost*8

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

    if not (target:addBardSong(caster,dsp.effect.CAROL,power,0,duration,caster:getID(), dsp.magic.ele.WIND, 1)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.CAROL
end
