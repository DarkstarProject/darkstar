-----------------------------------
-- Area: Cloister of Tides
--  MOB: Leviathan Prime
-- Involved in Quest: Trial by Water, Trial Size Trial by Water
-- Involved in Mission: ASA-4 Sugar Coated Directive
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");

-----------------------------------
-- OnMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local mobId = mob:getID();

    -- ASA-4: Astral Flow Behavior - Guaranteed to Use At Least 5 times before killable, at specified intervals.
    if (mob:getBattlefield():getBcnmID() == 611 and GetMobAction(mobId) == ACTION_ATTACK) then
        local astralFlows = mob:getLocalVar("astralflows");
        if ((astralFlows == 0 and mob:getHPP() <= 80)
        or (astralFlows == 1 and mob:getHPP() <= 60)
        or (astralFlows == 2 and mob:getHPP() <= 40)
        or (astralFlows == 3 and mob:getHPP() <= 20)
        or (astralFlows == 4 and mob:getHPP() <= 1)) then
            mob:setLocalVar("astralflows",astralFlows + 1);
            mob:useMobAbility(866);
            if (astralFlows >= 5) then
                mob:setUnkillable(false);
            end
        end
    end

end;

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- ASA-4: Avatar is Unkillable Until Its Used Astral Flow At Least 5 times At Specified Intervals
    if (mob:getBattlefield():getBcnmID() == 611) then
        mob:setLocalVar("astralflows","0");
        mob:setUnkillable(true);
    end
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, killer, ally)
end;
