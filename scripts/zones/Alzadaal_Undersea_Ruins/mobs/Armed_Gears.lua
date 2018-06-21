-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  MOB: Armed Gears
-- !pos -19 -4 -153
-----------------------------------
-- todo
-- add add random elemental magic absorb to elements its casting

mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:addMod(dsp.mod.MDEF, 60);
    mob:addMod(dsp.mod.DEF, 60);
    mob:AnimationSub(0);
end;

function onMobFight(mob,target)
    local mobHPP = mob:getHPP();
    if (mobHPP >= 26 and mobHPP <= 49) then
        if mob:AnimationSub() ~= 1 then
            mob:AnimationSub(1); -- double gear
        end
        if mob:getLocalVar("Def1") == 0 then
            mob:delMod(dsp.mod.MDEF, 10);
            mob:delMod(dsp.mod.DEF, 20);
            mob:setLocalVar("Def1",1);
        end
    elseif mobHPP <= 25 then
        if mob:AnimationSub() ~= 2 then
            mob:AnimationSub(2); -- single gear
        end
        if mob:getLocalVar("Def2") == 0 then
            mob:delMod(dsp.mod.MDEF, 10);
            mob:delMod(dsp.mod.DEF, 20);
            mob:setLocalVar("Def2",1);
        end
    elseif mobHPP > 50 then
        if mob:AnimationSub() ~= 0 then
            mob:AnimationSub(0); -- tripple gear
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;