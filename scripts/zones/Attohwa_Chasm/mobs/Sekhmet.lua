-----------------------------------
-- Area: Attohwa Chasm
--  NM:  Sekhmet
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
    mob:setMod(MOD_DOUBLE_ATTACK, 10);
    mob:setMod(MOD_FASTCAST, 15);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    mob:setRespawnTime(math.random(5400,7200)); -- 1.5 to 2 hours.
    UpdateNMSpawnPoint(mob:getID());
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob, killer)
end;


-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, player)
    local chance = 100;
    local resist = applyResistanceAddEffect(mob,player,ELE_DARK,EFFECT_ENASPIR);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local mp = math.random(1,10);
        if (player:getMP() < mp) then
            mp = player:getMP();
        end
        if (mp == 0) then
            return 0,0,0;
        else
            player:delMP(mp);
            mob:addMP(mp);
            return SUBEFFECT_MP_DRAIN, MSGBASIC_ADD_EFFECT_MP_DRAIN, mp;
        end
    end
end;