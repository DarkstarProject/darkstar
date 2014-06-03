-----------------------------------
-- Area: Empyreal Paradox
-- NPC:  Prishe
-- Chains of Promathia 8-4 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

function onMobInitialize(mob)

end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

function onMobEngaged(mob, target)

end;

function onMobFight(mob, target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

end;

function OnMobRoamAction(mob)
    local wait = mob:getExtraVar(1);
    if (wait > 30) then
        mob:setExtraVar(0);
        --mob:addEnmity(GetMobByID(16924673),0,1);
    else
        mob:setExtraVar(wait+3);
    end
end;