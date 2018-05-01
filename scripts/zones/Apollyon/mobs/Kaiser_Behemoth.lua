-----------------------------------
-- Area: Apollyon NW
--  NPC: Kaiser Behemoth

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/magic");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 60);
end;

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
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
    GetNPCByID(16932864+111):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+111):setStatus(dsp.status.NORMAL);
end;
