-----------------------------------
-- Area: Stellar Fulcrum
-- NPC:  Kam'lanaut
-- Zilart Mission 8 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

local blades = {567, 570, 572, 569, 568, 571};

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

function onMobFight(mob, target)

    local changeTime, element = mob:getExtraVar(2);
    if (changeTime == 0) then
        mob:setExtraVar(math.random(1,3)*15, element)
        return;
    end
    if (mob:getBattleTime() >= changeTime) then
        local newelement = element;
        while (newelement == element) do
            newelement = math.random(1,6);
        end
        if (element ~= 0) then
            mob:delMod(absorbMod[element], 100);
        end
        mob:useMobAbility(blades[newelement]);
        mob:addMod(absorbMod[newelement], 100);
        mob:setExtraVar(mob:getBattleTime() + math.random(1,3)*15, newelement);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	killer:addTitle(DESTROYER_OF_ANTIQUITY);
end;