-----------------------------------
-- Area: Attohwa Chasm
-- NPC:  Tiamat
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

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
	
	-- Gains a large attack boost when health is under 25% which cannot be Dispelled. 
	if(mob:getHP() < ((mob:getMaxHP() / 10) * 2.5)) then
		if(mob:hasStatusEffect(EFFECT_ATTACK_BOOST) == false) then
			mob:addStatusEffect(EFFECT_ATTACK_BOOST,75,0,0);
            mob:getStatusEffect(EFFECT_ATTACK_BOOST):setFlag(32);
		end
	end
    if (mob:hasStatusEffect(EFFECT_MIGHTY_STRIKES) == false and mob:actionQueueEmpty() == true) then
        local changeTime, twohourTime, changeHP = mob:getExtraVar(3);

        if (twohourTime == 0) then
            twohourTime = math.random(8, 14);
            mob:setExtraVar(changeTime, twohourTime, changeHP);
        end
        
        if (mob:AnimationSub() == 2 and mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(432);
            mob:setExtraVar(changeTime, math.random((mob:getBattleTime()/15)+4, (mob:getBattleTime()/15)+8), changeHP);
        elseif(mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(true);
            --and record the time and HP this phase was started
            mob:setExtraVar(mob:getBattleTime(), twohourTime, mob:getHP()/1000);
        -- subanimation 1 is flight, so check if she should land
        elseif(mob:AnimationSub() == 1 and (mob:getHP()/1000 <= changeHP - 10 or
                mob:getBattleTime() - changeTime > 120)) then
            mob:useMobAbility(1026);
            mob:setExtraVar(mob:getBattleTime(), twohourTime, mob:getHP()/1000);
        -- subanimation 2 is grounded mode, so check if she should take off
        elseif(mob:AnimationSub() == 2 and (mob:getHP()/1000 <= changeHP - 10 or
                mob:getBattleTime() - changeTime > 120)) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(true);
            mob:setExtraVar(mob:getBattleTime(), twohourTime, mob:getHP()/1000);
        end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(TIAMAT_TROUNCER);
    mob:setRespawnTime(math.random((259200),(432000)));	-- 3 to 5 days	
end;