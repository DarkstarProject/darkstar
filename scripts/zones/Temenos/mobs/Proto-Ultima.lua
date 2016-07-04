-----------------------------------
-- Area: Temenos
--  MOB: Proto-Ultima
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/limbus");


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:SetMagicCastingEnabled(false);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local phase = mob:getLocalVar("battlePhase");
    if (mob:actionQueueEmpty() == true) then
        if (mob:getHPP() < (80 - (phase * 20))) then
            mob:useMobAbility(1524); -- use Dissipation on phase change
            phase = phase + 1;
            if (phase == 2) then -- enable Holy II
                mob:SetMagicCastingEnabled(true);
            end
            if (phase == 4) then -- add Regain in final phase
                if (mob:hasStatusEffect(EFFECT_REGAIN) == false) then
                    mob:addStatusEffect(EFFECT_REGAIN,7,3,0);
                    mob:getStatusEffect(EFFECT_REGAIN):setFlag(32);
                end
            end
            mob:setLocalVar("battlePhase", phase); -- incrementing the phase here instead of in the Dissipation skill because stunning it prevents use.
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(TEMENOS_LIBERATOR);
    GetNPCByID(16928768+79):setPos(-559,5,-357);
    GetNPCByID(16928768+79):setStatus(STATUS_NORMAL);
    GetNPCByID(16928768+474):setStatus(STATUS_NORMAL);
end;
