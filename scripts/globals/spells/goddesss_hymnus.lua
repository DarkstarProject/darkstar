-----------------------------------------
-- Spell: Goddess's Hymnus
-- Grants Reraise.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

        local duration = 120;

        duration = duration * (caster:getMod(MOD_SONG_DURATION_BONUS)/100)

        target:addBardSong(caster,EFFECT_HYMNUS,1,0,duration,caster:getID(), 0, 1);

    return EFFECT_HYMNUS;
end;