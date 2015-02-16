-----------------------------------
-- Area: Legion
-- Veiled_Ironclad 

-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");
require("scripts/globals/spoofchat");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    -- MobMods
	mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
	
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1); 
    mob:setMobMod(MOBMOD_SUB_2HOUR, 1);
	
    mob:addMod(MOD_DOUBLE_ATTACK, 15);	
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Mods
    mob:setMod(MOD_REGEN, 20);
    mob:setMod(MOD_REGAIN, 35);
    mob:setMod(MOD_HASTE_ABILITY, 20);
    mob:setMod(MOD_COUNTER, 25);	
    mob:addMod(MOD_MACC,425);	
    mob:addMod(MOD_ATT,105);
    mob:addMod(MOD_MDEF,55);
    mob:addMod(MOD_DEF,125);	
end;

-----------------------------------

-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local BattleStart = mob:getLocalVar("BattleStart");
    local Veiled_Ironclad_2hr_Used = 0;
    if (mob:getLocalVar("Veiled_Ironclad_2hr_Used") ~= nil) then
        Veiled_Ironclad_2hr_Used = mob:getLocalVar("Veiled_Ironclad_2hr_Used");
    end

    if (mob:getHPP() <= 10) then 
        if (Veiled_Ironclad_2hr_Used == 2) then
            mob:useMobAbility(434); -- HF
            mob:setLocalVar("Veiled_Ironclad_2hr_Used", 3);
        end
    elseif (mob:getHPP() <= 30) then 
        if (Veiled_Ironclad_2hr_Used == 1) then
            mob:useMobAbility(432); -- MS
            mob:setLocalVar("Veiled_Ironclad_2hr_Used", 2);
        end
    elseif (mob:getHPP() <= 70) then 
        if (Veiled_Ironclad_2hr_Used == 0) then
            mob:useMobAbility(434); -- HF
            mob:setLocalVar("Veiled_Ironclad_2hr_Used", 1);
        end
    end
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
 	if ((math.random(1,10) ~= 3) or (target:hasStatusEffect(EFFECT_STUN) == true)) then
		return 0,0,0;
	else
		local duration = 5;
		target:addStatusEffect(EFFECT_STUN,1,0,duration);
		mob:resetEnmity(target);
		return SUBEFFECT_NONE,0,EFFECT_STUN;
	end   
end;

-----------------------------------
-- onMagicHit
-----------------------------------

function onMagicHit(caster, target, spell)

end

-----------------------------------
-- onSpikesDamage
-----------------------------------

function onSpikesDamage(mob,target,damage)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    killer:addCurrency("legion_point", 100);
end;