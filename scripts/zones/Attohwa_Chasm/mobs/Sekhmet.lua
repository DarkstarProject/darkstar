-----------------------------------
-- Area: Attohwa Chasm
-- NPC: Sekhmet
-- ID: 16805962
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_DMGMAGIC, -50);
    mob:addMod(MOD_DMGRANGE, -50);
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
    mob:setRespawnTime(math.random(5400,7200));	-- 1.5 to 2 hours.
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob, killer)
    mob:setRespawnTime(math.random(5400,7200));	-- 1.5 to 2 hours.
end;


-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, player)
    local chance = 10;	
	local resist = applyResistanceAddEffect(mob,player,ELE_DARK,EFFECT_ENASPIR);
	if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local mp = math.random(1,10);
        if (player:getMP() < mp) then
            mp = player:getMP();
        end
        player:delMP(mp);
        mob:addMP(mp);
        return SUBEFFECT_MP_DRAIN, 162, EFFECT_ENASPIR;
    end
end;