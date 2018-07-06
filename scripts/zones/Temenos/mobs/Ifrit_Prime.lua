-----------------------------------
-- Area: Temenos E T    
-- NPC: Mystic Avatar Ifrit
-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
require("scripts/zones/Temenos/MobIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();    
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();        
    
    if (mobID==16928844) then
        GetNPCByID(TEMENOS_BASE_CRATE+40):setPos(mobX,mobY,mobZ);
        GetNPCByID(TEMENOS_BASE_CRATE+40):setStatus(dsp.status.NORMAL);
    end     

end;