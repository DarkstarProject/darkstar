-----------------------------------
-- Area: Temenos N T
--  Mob: Goblin Theurgist
-----------------------------------
require("scripts/globals/limbus");
-----------------------------------

function onMobEngaged(mob,target)
GetMobByID(16928831):updateEnmity(target);
GetMobByID(16928832):updateEnmity(target);
GetMobByID(16928834):updateEnmity(target);

end;

function onMobDeath(mob, player, isKiller)
 if (IsMobDead(16928831)==true and IsMobDead(16928832)==true and IsMobDead(16928833)==true and IsMobDead(16928834)==true and IsMobDead(16928835)==true ) then
       GetNPCByID(16928768+39):setPos(-599,85,438);
    GetNPCByID(16928768+39):setStatus(dsp.status.NORMAL);

    GetNPCByID(16928768+456):setStatus(dsp.status.NORMAL);
 end
end;