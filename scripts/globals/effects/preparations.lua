-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/utils");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	local timer = target:getVar("preptime");
	local settick = timer;

	effect:getTick(timer-1);
	effect:setTick(1);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local TextIDs = "scripts/zones/" .. target:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 

	local LastZone = target:getPreviousZone();
    local preptime = target:getVar("preptime");
	local tick = preptime-1;

	effect:getTick(tick);
	effect:setTick(1);

	target:setVar("preptime",tick);

	if (LastZone == 132 or LastZone == 15 or LastZone == 45 or LastZone == 215 or LastZone == 216 or LastZone == 217 or LastZone == 218 or LastZone == 253 or LastZone == 254) then
		target:delStatusEffectSilent(EFFECT_PREPARATIONS);	-- make sure you lose status on zone out.
	end

	-- print("tick",tick);

	if (target:hasStatusEffect(EFFECT_VISITANT) == false) then
		if (preptime == 300) then
			target:messageSpecial(EXIT_WARNING_2,5,1,0);
		elseif (preptime == 60)then
			target:messageSpecial(EXIT_WARNING_4,1,1,0);
		elseif (preptime == 30)then
			target:messageSpecial(EXIT_WARNING_4,30,0,0);
		elseif (preptime == 10)then
			target:messageSpecial(EXIT_WARNING_4,10,0,0);
		elseif (preptime == 1) then
			target:messageSpecial(EXITING_NOW);
		end
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
--[[----------------------------
	ABYSSEA_LA_THEINE  = 132; 
	ABYSSEA_KONSCHTAT  = 15;
	ABYSSEA_TAHRONGI   = 45;
	ABYSSEA_ATTOHWA    = 215;
	ABYSSEA_MISAREAUX  = 216;
	ABYSSEA_VUNKERL    = 217;
	ABYSSEA_ALTEPA	   = 218;
	ABYSSEA_ULEGUERAND = 253;
	ABYSSEA_GRAUBERG   = 254;
----------------------------]]--
	local Zone = target:getZone();
	target:setVar("preptime",300);
	if (target:hasStatusEffect(EFFECT_VISITANT) == false) then
		if (Zone == 132) then
			target:setPos(0,0,0,0,0);
		elseif (Zone == 15) then
			target:setPos(91,-68,-582,107,108);
		elseif (Zone == 45) then
			target:setPos(0,0,0,0,0);
		elseif (Zone == 215) then
			target:setPos(0,0,0,0,0);
		elseif (Zone == 216) then
			target:setPos(0,0,0,0,0);
		elseif (Zone == 217) then
			target:setPos(0,0,0,0,0);
		elseif (Zone == 218) then
			target:setPos(0,0,0,0,0);
		elseif (Zone == 253) then
			target:setPos(0,0,0,0,0);
		elseif (Zone == 254) then
			target:setPos(0,0,0,0,0);
		end
	end
end;