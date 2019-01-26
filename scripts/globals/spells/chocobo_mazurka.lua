-----------------------------------------
-- Spell: Chocobo Mazurka
-- Gives party members enhanced movement
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local power = 24

    local iBoost = caster:getMod(dsp.mod.MAZURKA_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)

    local duration = 120

    duration = duration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        duration = duration * 2
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        duration = duration * 1.5
    end
    caster:delStatusEffect(dsp.effect.MARCATO)

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster,dsp.effect.MAZURKA,power,0,duration,caster:getID(), 0, 1)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.MAZURKA
end

