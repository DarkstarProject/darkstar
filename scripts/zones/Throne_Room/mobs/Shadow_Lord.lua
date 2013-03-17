-----------------------------------
-- Area: Throne Room
-- NPC:  Shadow Lord
-- Mission 5-2 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)

end;

-----------------------------------
-- onMobEngaged
-----------------------------------

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
	-- 1st form
	-- after change magic or physical immunity every 5min or 1k dmg
	-- 2nd form
	-- the Shadow Lord will do nothing but his Implosion attack. This attack hits everyone in the battlefield, but he only has 4000 HP

	if(mob:getID() < 17453060) then -- first phase AI
		if(mob:getHP() / mob:getMaxHP() <= 0.5) then
		
			local changeTime, changeHP = mob:getExtraVar(2);
		
			if(mob:AnimationSub() == 0) then
				mob:AnimationSub(1);
				mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
				mob:addStatusEffectEx(EFFECT_MAGIC_SHIELD, 0, 1, 0, 0);
				mob:SetAutoAttackEnabled(false);
				mob:SetMagicCastingEnabled(true);
				mob:setSpellCooldown(2000);
				mob:setExtraVar(mob:getBattleTime(), mob:getHP());
			elseif(mob:AnimationSub() == 2 and (mob:getHP() <= changeHP - 1000 or 
					mob:getBattleTime() - changeTime > 300)) then
				mob:AnimationSub(1);
				mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
				mob:addStatusEffectEx(EFFECT_MAGIC_SHIELD, 0, 1, 0, 0);
				mob:SetAutoAttackEnabled(false);
				mob:SetMagicCastingEnabled(true);
				mob:setSpellCooldown(2000);
				mob:setExtraVar(mob:getBattleTime(), mob:getHP());
			elseif(mob:AnimationSub() == 1 and (mob:getHP() <= changeHP - 1000 or 
					mob:getBattleTime() - changeTime > 300)) then
				mob:useMobAbility(417);
				mob:AnimationSub(2);
				mob:delStatusEffect(EFFECT_MAGIC_SHIELD);
				mob:addStatusEffectEx(EFFECT_PHYSICAL_SHIELD, 0, 1, 0, 0);
				mob:SetAutoAttackEnabled(true);
				mob:SetMagicCastingEnabled(false);
				mob:setSpellCooldown(10000);
				mob:setExtraVar(mob:getBattleTime(), mob:getHP());
			end
		end
	else --second phase AI
		if( mob:getBattleTime() % 9 < 2 ) then
			mob:useMobAbility(413);
		end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	if(mob:getID() < 17453060) then
		killer:startEvent(0x7d04);
		killer:setVar("mobid",mob:getID());
	else
		killer:addTitle(SHADOW_BANISHER);
	end
	mob:AnimationSub(0);
	mob:SetAutoAttackEnabled(true);
	mob:SetMagicCastingEnabled(true);
	mob:setSpellCooldown(10000);
	mob:delStatusEffect(EFFECT_MAGIC_SHIELD);
	mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
	mob:setExtraVar(0);
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("updateCSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("finishCSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(csid == 0x7d04) then
		local mobid = player:getVar("mobid");
		DespawnMob(mobid);
		player:setVar("mobid",0);
		
		mob = SpawnMob(mobid+3);
		mob:updateEnmity(player);
		mob:SetMagicCastingEnabled(false);
		mob:SetAutoAttackEnabled(false);
		mob:SetMobAbilityEnabled(false);
	end
	
end;