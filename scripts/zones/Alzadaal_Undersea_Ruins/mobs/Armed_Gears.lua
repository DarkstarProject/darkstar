-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  MOB: Armed Gears
-- !pos -19 -4 -153
-----------------------------------
-- todo
-- add add random elemental magic absorb to elements its casting

mixins = {require("scripts/mixins/job_special")};

function onMobSpawn(mob)
    mob:addMod(MOD_MDEF, 60);
    mob:addMod(MOD_DEF, 60);
    mob:AnimationSub(0);
end;

function onMobFight(mob,target)
    local mobHPP = mob:getHPP();
    if (mobHPP >= 26 and mobHPP <= 49) then
        mob:AnimationSub(1); -- double gear
        if mob:getLocalVar("Def1") == 0 then
            mob:delMod(MOD_MDEF, 10);
            mob:delMod(MOD_MDEF, 10);
            mob:setLocalVar("Def1",1);
        end
    elseif mobHPP <= 25 then
    mob:AnimationSub(2);
        if mob:getLocalVar("Def2") == 0 then
            mob:delMod(MOD_MDEF, 10);
            mob:delMod(MOD_MDEF, 10);
            mob:setLocalVar("Def2",1);
        end
    elseif mobHPP > 50 then
        mob:AnimationSub(0); -- tripple gear
    end
end

function onMobDeath(mob, player, isKiller)

end;
