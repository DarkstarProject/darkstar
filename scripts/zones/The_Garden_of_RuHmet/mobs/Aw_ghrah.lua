-----------------------------------
-- Area: The Garden of Ru'Hmet
-- MOB:  Aw'ghrah
-----------------------------------

-----------------------------------
-- OnMobInitialize Action
-----------------------------------

function onMobSpawn(mob)
	local skin = math.random(1161,1168);
	mob:setModelId(skin);
	if(skin == 1161) then -- Fire
		mob:addMod(MOD_ICERES, 27);
		mob:addMod(MOD_WATERRES, -27);
	elseif(skin == 1164) then --Earth
		mob:addMod(MOD_THUNDERRES, 27);
		mob:addMod(MOD_WINDRES, -27);
	elseif(skin == 1162) then -- Water
		mob:addMod(MOD_FIRERRES, 27);
		mob:addMod(MOD_THUNDERRES, -27);
	elseif(skin == 1163) then -- Wind
		mob:addMod(MOD_EARTHRES, 27);
		mob:addMod(MOD_ICERES, -27);
	elseif(skin == 1166) then --Ice
		mob:addMod(MOD_WINDRES, 27);
		mob:addMod(MOD_FIRERES, -27);
	elseif(skin == 1165) then --Lightning
		mob:addMod(MOD_WATERRRES, 27);
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
	mob:SetLocalVar("form1",0);
	mob:SetLocalVar("form2",math.random(1,3));
end;
-----------------------------------
-- OnMobRoam Action
-----------------------------------

function onMobRoam(mob)
end;

-----------------------------------
-- OnMobFight Action
-- Set ball form and secondary form
-----------------------------------
function onMobFight(mob,target)
	local meltdown = 0;
		
	local changeTime = mob:getLocalVar("changeTime");
	
	if(mob:AnimationSub() == mob:getLocalVar("form1") and mob:getBattleTime() - changeTime > 60) then
		mob:AnimationSub(mob:getLocalVar("form2"));
		mob:setLocalVar("changeTime", mob:getBattleTime());
	elseif(mob:AnimationSub() == mob:getLocalVar("form2") and mob:getBattleTime() - changeTime > 60) then
		mob:AnimationSub(mob:getLocalVar("form1"));
		mob:setLocalVar("changeTime", mob:getBattleTime());
		meltdown = math.random(1,100);
		if(meltdown >=95) then
		mob:useMobAbility(1186); -- Use Meltdown
		end
	end
end;

function onMobDeath(mob)
end;