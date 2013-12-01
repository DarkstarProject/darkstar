-----------------------------------
--
-- 	EFFECT_TELEPORT
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/teleports");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)

local Teleport = target:getStatusEffect(EFFECT_TELEPORT):getPower();
--target:setVar("TELEPORT_POINT",Teleport);

end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)

   local effect = target:getStatusEffect(EFFECT_TELEPORT);
   local Teleport = effect:getPower();
	if(Teleport == TELEPORT_DEM) then
		toDem(target);
	elseif(Teleport == TELEPORT_HOLLA) then
		toHolla(target);
	elseif(Teleport == TELEPORT_YHOAT) then
		toYhoat(target);
	elseif(Teleport == TELEPORT_VAHZL) then
		toVahzl(target);
	elseif(Teleport == TELEPORT_MEA) then
		toMea(target);
	elseif(Teleport == TELEPORT_ALTEP) then
		toAltep(target);
	elseif(Teleport == TELEPORT_WARP) then
		target:warp();
	elseif(Teleport == TELEPORT_ESCAPE) then
		Escape(target, target:getZone());
	end
   
end;