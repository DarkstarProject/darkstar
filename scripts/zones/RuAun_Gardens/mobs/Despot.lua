-----------------------------------
-- Area: RuAun Gardens
--  NM:  Despot
-----------------------------------

function onMobWeaponSkill(target, mob, skill)
    if (skill:getID() == 536) then
        local panzerfaustCounter = mob:getLocalVar("panzerfaustCounter");
        local panzerfaustMax = mob:getLocalVar("panzerfaustMax");

        if (panzerfaustCounter == 0 and panzerfaustMax == 0) then
            panzerfaustMax = math.random(2,5);
            mob:setLocalVar("panzerfaustMax", panzerfaustMax);
        end

        panzerfaustCounter = panzerfaustCounter +1;
        mob:setLocalVar("panzerfaustCounter", panzerfaustCounter);

        if (panzerfaustCounter > panzerfaustMax) then
            mob:setLocalVar("panzerfaustCounter", 0);
            mob:setLocalVar("panzerfaustMax", 0);
        else
            mob:useMobAbility(536);
        end
    end;
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
