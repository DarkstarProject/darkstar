-----------------------------------
-- Area: Apollyon NW
--  NPC: Kaiser Behemoth
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/magic");
require("scripts/zones/Apollyon/MobIDs");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 60);
end;

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobFight(mob,target)
    if ((IsMobDead(16932986) == false) or (IsMobDead(16932987) == false) or (IsMobDead(16932988) == false)) then  --link Kronprinz
        GetMobByID(16932986):updateEnmity(target);
        GetMobByID(16932987):updateEnmity(target);
        GetMobByID(16932988):updateEnmity(target);
    end
end;

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then
        spell:setAoE(dsp.magic.aoe.RADIAL);
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL);
        spell:setRadius(30);
        spell:setAnimation(280);
        spell:setMPCost(1);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(APOLLYON_BASE_CRATE+111):setPos(mobX,mobY,mobZ);
    GetNPCByID(APOLLYON_BASE_CRATE+111):setStatus(dsp.status.NORMAL);
end;
