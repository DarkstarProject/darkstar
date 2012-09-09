-----------------------------------
--	[Command name]: godmode
--	[Author      ]: bluekirby0
--	[Description ]: Grants the user several special abilities that may aid in testing, or just plain showing off.
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target)
	if (player:getVar("GodMode") == 0) then
		player:setVar("GodMode",1)
		player:addStatusEffect(EFFECT_INVINCIBLE,1,0,0);
		player:addStatusEffect(EFFECT_PERFECT_DODGE,1,0,0);
		player:addStatusEffect(EFFECT_MIGHTY_STRIKES,1,0,0);
		player:addStatusEffect(EFFECT_HUNDRED_FISTS,1,0,0);
		player:addStatusEffect(EFFECT_CHAINSPELL,1,0,0);
		player:addStatusEffect(EFFECT_MANAFONT,1,0,0);		
		player:addStatusEffect(EFFECT_SNEAK_ATTACK,1,0,0);
		player:addStatusEffect(EFFECT_REGAIN,100,1,0);
	else
		player:setVar("GodMode",0)
		player:delStatusEffect(EFFECT_INVINCIBLE);
		player:delStatusEffect(EFFECT_PERFECT_DODGE);
		player:delStatusEffect(EFFECT_MIGHTY_STRIKES);
		player:delStatusEffect(EFFECT_HUNDRED_FISTS);
		player:delStatusEffect(EFFECT_CHAINSPELL);
		player:delStatusEffect(EFFECT_MANAFONT);
		player:delStatusEffect(EFFECT_SNEAK_ATTACK);
		player:delStatusEffect(EFFECT_REGAIN);
	end
end;
