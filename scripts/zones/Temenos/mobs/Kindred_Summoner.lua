-----------------------------------
-- Area: Temenos N T
--  Mob: Kindred Summoner
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------

function onMobEngaged(mob,target)
    GetMobByID(16928800):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if limbus.isMobDead(16928797) and limbus.isMobDead(16928798) then
        GetNPCByID(16928768+27):setPos(-120, -80, 429)
        GetNPCByID(16928768+27):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+161):setPos(-123, -80, 429)
        GetNPCByID(16928768+161):setStatus(dsp.status.NORMAL)
        GetNPCByID(16928768+212):setPos(-117, -80, 429)
        GetNPCByID(16928768+212):setStatus(dsp.status.NORMAL)
    end
end