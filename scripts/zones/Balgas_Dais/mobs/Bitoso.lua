-----------------------------------
-- Area: Balga's Dais
-- MOB: Bitoso
-- BCNM Fight: Creeping Doom
-----------------------------------
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 4);
end;

function onMobFight (mob,target)
end

function onMagicHit(caster, target, spell)
    if (spell:getID() == 356) then
        spell:setFlag(SPELLFLAG_WIPE_SHADOWS);
    end
end

function onMobDeath(mob, player, isKiller)
end;
