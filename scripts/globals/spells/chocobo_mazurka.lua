-----------------------------------------
-- Spell: Chocobo Mazurka
-- Gives party members enhanced movement
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local power = 24;

    local iBoost = caster:getMod(MOD_MAZURKA_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);

    local duration = 120;

    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(dsp.effects.SOUL_VOICE)) then
        duration = duration * 2;
    elseif (caster:hasStatusEffect(dsp.effects.MARCATO)) then
        duration = duration * 1.5;
    end
    caster:delStatusEffect(dsp.effects.MARCATO);

    if (caster:hasStatusEffect(dsp.effects.TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,dsp.effects.MAZURKA,power,0,duration,caster:getID(), 0, 1)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return dsp.effects.MAZURKA;
end;

