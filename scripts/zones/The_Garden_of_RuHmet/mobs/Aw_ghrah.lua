-----------------------------------
-- Area: The Garden of Ru'Hmet
-- MOB:  Aw'ghrah
-----------------------------------
require("scripts/globals/status");
-----------------------------------
-- OnMobSpawn Action
-- Set core Skin and mob elemental bonus
-- Set to non aggro. 
-----------------------------------

function onMobSpawn(mob)
	mob:AnimationSub(0);
	mob:unsetAggroFlag(8);
	mob:setLocalVar("roamTime", os.time());
	mob:setLocalVar("form2",math.random(1,3));
	local skin = math.random(1161,1168);
	mob:setModelId(skin);
	if(skin == 1161) then -- Fire
		mob:addMod(MOD_ICERES, 27);
		mob:addMod(MOD_WATERRES, -27);
	elseif(skin == 1164) then --Earth
		mob:addMod(MOD_THUNDERRES, 27);
		mob:addMod(MOD_WINDRES, -27);
	elseif(skin == 1162) then -- Water
		mob:addMod(MOD_FIRERES, 27);
		mob:addMod(MOD_THUNDERRES, -27);
	elseif(skin == 1163) then -- Wind
		mob:addMod(MOD_EARTHRES, 27);
		mob:addMod(MOD_ICERES, -27);
	elseif(skin == 1166) then --Ice
		mob:addMod(MOD_WINDRES, 27);
		mob:addMod(MOD_FIRERES, -27);
	elseif(skin == 1165) then --Lightning
		mob:addMod(MOD_WATERRES, 27);
		mob:addMod(MOD_EARTHRES, -27);
	elseif(skin == 1167) then --Light
		mob:addMod(MOD_LIGHTRES, 27);
		mob:addMod(MOD_DARKRES, -27);
	elseif(skin == 1168) then --Dark
		mob:addMod(MOD_DARKRES, 27);
		mob:addMod(MOD_LIGHTRES, -27);
	end
end;

function onMobEngage(mob)
end;
-----------------------------------
-- onMobRoam Action
-- Autochange Aggro and Form
-----------------------------------

function onMobRoam(mob)
	local roamTime = mob:getLocalVar("roamTime");
	if(mob:AnimationSub() == 0 and os.time() - roamTime > 60) then
		mob:AnimationSub(mob:getLocalVar("form2"));
		mob:setLocalVar("roamTime", os.time());
		mob:setAggroFlag(8);		
	elseif(mob:AnimationSub() == mob:getLocalVar("form2") and os.time() - roamTime > 60) then
		mob:AnimationSub(0);
		mob:unsetAggroFlag(8);
		mob:setLocalVar("roamTime", os.time());
	end
end;

-----------------------------------
-- OnMobFight Action
-- Set ball form and secondary form
-----------------------------------
function onMobFight(mob,target)
	local meltdown = 0;
		
	local changeTime = mob:getLocalVar("changeTime");
	
	if(mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
		mob:AnimationSub(mob:getLocalVar("form2"));
		mob:setLocalVar("changeTime", mob:getBattleTime());
	elseif(mob:AnimationSub() == mob:getLocalVar("form2") and mob:getBattleTime() - changeTime > 60) then
		mob:AnimationSub(0);
		mob:setLocalVar("changeTime", mob:getBattleTime());
		meltdown = math.random(1,100);
		if(meltdown >=95) then
		mob:useMobAbility(1186); -- Use Meltdown
		end
	end
end;

function onMobDeath(mob)
end;
