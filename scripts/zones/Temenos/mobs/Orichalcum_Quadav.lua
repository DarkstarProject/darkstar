-----------------------------------
-- Area: Temenos
-- NPC:  Orichalcum Quadav
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
require("scripts/zones/Temenos/MobIDs");
mixins = {require("scripts/mixins/job_special")};
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    if (GetMobByID(16929017):isDead() and GetMobByID(16929018):isDead() and GetMobByID(16929019):isDead() and
        GetMobByID(16929020):isDead() and GetMobByID(16929021):isDead() and GetMobByID(16929022):isDead()) then
        mob:setMod(dsp.mod.SLASHRES,1400);
        mob:setMod(dsp.mod.PIERCERES,1400);
        mob:setMod(dsp.mod.IMPACTRES,1400);
        mob:setMod(dsp.mod.HTHRES,1400);
    else
        mob:setMod(dsp.mod.SLASHRES,300);
        mob:setMod(dsp.mod.PIERCERES,300);
        mob:setMod(dsp.mod.IMPACTRES,300);
        mob:setMod(dsp.mod.HTHRES,300);
    end
    GetMobByID(16929005):updateEnmity(target);
    GetMobByID(16929007):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
    GetMobByID(16929005):addMod(dsp.mod.ATT,150);
    GetMobByID(16929007):addMod(dsp.mod.ATT,150);
    if (GetMobByID(16929005):isDead() and GetMobByID(16929007):isDead()) then
        GetNPCByID(TEMENOS_BASE_CRATE+78):setPos(-280,-161,-440);
        GetNPCByID(TEMENOS_BASE_CRATE+78):setStatus(dsp.status.NORMAL);
        GetNPCByID(16928770+474):setStatus(dsp.status.NORMAL);
    end
end;