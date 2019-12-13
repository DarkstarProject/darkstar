-----------------------------------
-- Area: Balga's Dais
--  Mob: Bitoso
-- BCNM: Creeping Doom
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 4);
end;

function onMobFight (mob,target)
end

function onMagicHit(caster, target, spell)
    if (spell:getID() == 356) then
        spell:setFlag(dsp.magic.spellFlag.WIPE_SHADOWS);
    end
end

function onMobDeath(mob, player, isKiller)
end;
