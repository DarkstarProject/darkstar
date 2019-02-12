-----------------------------------
-- Area: Apollyon (Central)
--  MOB: Proto-Omega
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/titles");
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
    mob:setMod(dsp.mod.COUNTER, 10) -- "Possesses a Counter trait"
    mob:setMod(dsp.mod.REGEN, 25) -- "Posseses an Auto-Regen (low to moderate)"
end;

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
    mob:setMod(dsp.mod.UDMGPHYS, -75);
    mob:setMod(dsp.mod.UDMGRANGE, -75);
    mob:setMod(dsp.mod.UDMGMAGIC, 0);
    mob:setMod(dsp.mod.MOVE, 100) -- "Moves at Flee Speed in Quadrupedal stance and in the Final Form"
end;

function onMobFight(mob,target)
    local mobID = mob:getID();
    local formTime = mob:getLocalVar("formWait")
    local lifePercent = mob:getHPP();
    local currentForm = mob:getLocalVar("form")

    if (lifePercent < 70 and currentForm < 1) then
        currentForm = 1;
        mob:setLocalVar("form", currentForm)
        mob:AnimationSub(2);
        formTime = os.time() + 60;
        mob:setMod(dsp.mod.UDMGPHYS, 0);
        mob:setMod(dsp.mod.UDMGRANGE, 0);
        mob:setMod(dsp.mod.UDMGMAGIC, -75);
        mob:setMod(dsp.mod.MOVE, 0)
    end

    if (currentForm == 1) then
        if (formTime < os.time()) then
            if (mob:AnimationSub() == 1) then
                mob:AnimationSub(2);
            else
                mob:AnimationSub(1);
            end
            mob:setLocalVar("formWait", os.time() + 60);
        end

        if (lifePercent < 30) then
            mob:AnimationSub(2);
            mob:setMod(dsp.mod.UDMGPHYS, -50);
            mob:setMod(dsp.mod.UDMGRANGE, -50);
            mob:setMod(dsp.mod.UDMGMAGIC, -50);
            mob:setMod(dsp.mod.MOVE, 100)
            mob:addStatusEffect(dsp.effect.REGAIN,7,3,0); -- The final form has Regain,
            mob:getStatusEffect(dsp.effect.REGAIN):setFlag(dsp.effectFlag.DEATH);
            currentForm = 2;
            mob:setLocalVar("form", currentForm)
        end
    end
end;

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.STUN)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.APOLLYON_RAVAGER);
end;

function onMobDespawn(mob)
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16932864+39):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+39):setStatus(dsp.status.NORMAL);
end;
