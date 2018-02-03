-----------------------------------
-- Area: Attohwa Chasm
--  NM:  Sekhmet
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
    mob:setMod(MOD_DOUBLE_ATTACK, 10);
    mob:setMod(MOD_FASTCAST, 15);
end;

function onAdditionalEffect(mob, target, damage)
    local chance = 100;
    local resist = applyResistanceAddEffect(mob,target,ELE_DARK,EFFECT_ENASPIR);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local mp = math.random(1,10);
        if (target:getMP() < mp) then
            mp = target:getMP();
        end
        if (mp == 0) then
            return 0,0,0;
        else
            target:delMP(mp);
            mob:addMP(mp);
            return SUBEFFECT_MP_DRAIN, msgBasic.ADD_EFFECT_MP_DRAIN, mp;
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(5400,7200)); -- 1.5 to 2 hours.
    UpdateNMSpawnPoint(mob:getID());
end;
