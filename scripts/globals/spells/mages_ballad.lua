-----------------------------------------
-- Spell: Mage's Ballad
-- Gradually restores target's MP.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local power = 1;

    local iBoost = caster:getMod(MOD_BALLAD_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    power = power + iBoost;

    if (caster:hasStatusEffect(EFFECT.SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(EFFECT.MARCATO)) then
        power = power * 1.5;
    end
    caster:delStatusEffect(EFFECT.MARCATO);

    local duration = 120;
    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(EFFECT.TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,EFFECT.BALLAD,power,0,duration,caster:getID(), 0, 1)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return EFFECT.BALLAD;
end;
