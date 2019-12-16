-----------------------------------
-- Area: Grand Palace of HuXzoi
--  Mob: Ix'ghrah
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/missions");
-----------------------------------

function onMobSpawn(mob)
    if (mob:getMod(dsp.mod.SLASHRES)) then mob:setMod(dsp.mod.SLASHRES,1000); end
    if (mob:getMod(dsp.mod.PIERCERES)) then mob:setMod(dsp.mod.PIERCERES,1000); end
    if (mob:getMod(dsp.mod.IMPACTRES)) then mob:setMod(dsp.mod.IMPACTRES,1000); end
    if (mob:getMod(dsp.mod.HTHRES)) then mob:setMod(dsp.mod.HTHRES,1000); end
end;

function onMobFight(mob,target)
    local changeTime = mob:getLocalVar("changeTime");

    if (mob:getBattleTime() - changeTime > 60) then
        mob:AnimationSub(math.random(0,3));
        mob:setLocalVar("changeTime", mob:getBattleTime());
    end
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.A_FATE_DECIDED  and player:getCharVar("PromathiaStatus")==1) then
        player:setCharVar("PromathiaStatus",2);
    end
end;