-----------------------------------
-- Area: Apollyon (Central)
--  MOB: Proto-Omega
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end;

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
    mob:setMod(dsp.mod.UDMGPHYS, -75);
    mob:setMod(dsp.mod.UDMGRANGE, -75);
    mob:setMod(dsp.mod.UDMGMAGIC, 0);
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
            mob:addStatusEffect(dsp.effect.REGAIN,7,3,0); -- The final form has Regain,
            mob:getStatusEffect(dsp.effect.REGAIN):setFlag(dsp.effectFlag.DEATH);
            currentForm = 2;
            mob:setLocalVar("form", currentForm)
        end
    end
end;

function onAdditionalEffect(mob, player)
    local chance = 20; -- wiki lists ~20% stun chance
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.THUNDER,dsp.effect.STUN);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 5 * resist;
        if (player:hasStatusEffect(dsp.effect.STUN) == false) then
            player:addStatusEffect(dsp.effect.STUN, 0, 0, duration);
        end
        return dsp.subEffect.STUN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.STUN;
    end
end;

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
