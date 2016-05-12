-----------------------------------
-- Area: Apollyon (Central)
--  MOB: Proto-Omega
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
    mob:setMod(MOD_UDMGPHYS, -75);
    mob:setMod(MOD_UDMGRANGE, -75);
    mob:setMod(MOD_UDMGMAGIC, 0);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

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
        mob:setMod(MOD_UDMGPHYS, 0);
        mob:setMod(MOD_UDMGRANGE, 0);
        mob:setMod(MOD_UDMGMAGIC, -75);
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
            mob:setMod(MOD_UDMGPHYS, -50);
            mob:setMod(MOD_UDMGRANGE, -50);
            mob:setMod(MOD_UDMGMAGIC, -50);
            mob:addStatusEffect(EFFECT_REGAIN,7,3,0); -- The final form has Regain,
            mob:getStatusEffect(EFFECT_REGAIN):setFlag(32);
            currentForm = 2;
            mob:setLocalVar("form", currentForm)
        end
    end
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, player)
    local chance = 20; -- wiki lists ~20% stun chance
    local resist = applyResistanceAddEffect(mob,player,ELE_THUNDER,EFFECT_STUN);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 5 * resist;
        if (player:hasStatusEffect(EFFECT_STUN) == false) then
            player:addStatusEffect(EFFECT_STUN, 0, 0, duration);
        end
        return SUBEFFECT_STUN, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_STUN;
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(APOLLYON_RAVAGER);
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();
    GetNPCByID(16932864+39):setPos(mobX,mobY,mobZ);
    GetNPCByID(16932864+39):setStatus(STATUS_NORMAL);
end;