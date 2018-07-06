-----------------------------------
-- Area: Apollyon SW
-- NPC:  Fir Bholg Rdm
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");
require("scripts/zones/Apollyon/MobIDs");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobFight (mob, target)

end;

function onMobDespawn(mob)
    if (GetMobByID(16932869):isDead() and GetMobByID(16932870):isDead()) then
        GetNPCByID(APOLLYON_BASE_CRATE+(15)):setPos(-412,0,-516);
        GetNPCByID(APOLLYON_BASE_CRATE+(15)):setStatus(dsp.status.NORMAL);
        GetNPCByID(APOLLYON_BASE_CRATE+(14)):setPos(-412,0,-520);
        GetNPCByID(APOLLYON_BASE_CRATE+(14)):setStatus(dsp.status.NORMAL);
        GetNPCByID(APOLLYON_BASE_CRATE+(16)):setPos(-412,0,-524);
        GetNPCByID(APOLLYON_BASE_CRATE+(16)):setStatus(dsp.status.NORMAL);
    end
end;