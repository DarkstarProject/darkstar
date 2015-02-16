-----------------------------------
-- Area: Legion
-- Lofty_Wyrm 

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
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1); 
    mob:setMobMod(MOBMOD_SUB_2HOUR, 1); 
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Mods
    mob:setMod(MOD_REGAIN,15);
    mob:setMod(MOD_REGEN,25);	
    mob:addMod(MOD_MACC,425);		
    mob:addMod(MOD_MATT,45);
    mob:addMod(MOD_MDEF,25);	
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
    local Lofty_Wyrm_2hr = 0;
    if (mob:getLocalVar("Lofty_Wyrm_2hr") ~= nil) then
        Lofty_Wyrm_2hr = mob:getLocalVar("Lofty_Wyrm_2hr");
    end

    if (mob:getHPP() <= 10) then 
        if (Lofty_Wyrm_2hr == 0) then
            mob:useMobAbility(432); -- MS
            mob:setLocalVar("Lofty_Wyrm_2hr", 1);
        end
    end	
	-- Gains a large attack boost when health is under 25% which cannot be Dispelled. 
	if(mob:getHP() < ((mob:getMaxHP() / 10) * 2.5)) then
		if(mob:hasStatusEffect(EFFECT_ATTACK_BOOST) == false) then
			mob:addStatusEffect(EFFECT_ATTACK_BOOST,75,0,0);
            mob:getStatusEffect(EFFECT_ATTACK_BOOST):setFlag(32);
		end
	end
    if (mob:hasStatusEffect(EFFECT_MIGHTY_STRIKES) == false and mob:actionQueueEmpty() == true) then
        local changeTime = mob:getLocalVar("changeTime")
        local twohourTime = mob:getLocalVar("twohourTime")
        local changeHP = mob:getLocalVar("changeHP")
        
        if (twohourTime == 0) then
            twohourTime = math.random(8, 14);
            mob:setLocalVar("twohourTime", twohourTime);
        end
        
        if (mob:AnimationSub() == 2 and mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(432);
            mob:setLocalVar("twohourTime", math.random((mob:getBattleTime()/15)+4, (mob:getBattleTime()/15)+8));
        elseif(mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(true);
            --and record the time and HP this phase was started
            mob:setLocalVar("changeTime", mob:getBattleTime());
            mob:setLocalVar("changeHP", mob:getHP()/1000);
        -- subanimation 1 is flight, so check if she should land
        elseif(mob:AnimationSub() == 1 and (mob:getHP()/1000 <= changeHP - 10 or
                mob:getBattleTime() - changeTime > 120)) then
            mob:useMobAbility(1026);
            mob:setLocalVar("changeTime", mob:getBattleTime());
            mob:setLocalVar("changeHP", mob:getHP()/1000);
        -- subanimation 2 is grounded mode, so check if she should take off
        elseif(mob:AnimationSub() == 2 and (mob:getHP()/1000 <= changeHP - 10 or
                mob:getBattleTime() - changeTime > 120)) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(true);
            mob:setLocalVar("changeTime", mob:getBattleTime());
            mob:setLocalVar("changeHP", mob:getHP()/1000);
        end
	end
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
    
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
    killer:addCurrency("legion_point", 10);
    SpawnMob(mob:getID()+3) -- Spawns Lofty_Zilant
end;