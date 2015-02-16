-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   -- local allegiance = target:getAllegiance();
   local ALLEGIANCE_CAMPAIGN_PLAYER = 9;
   target:setStatus(STATUS_UPDATE,ALLEGIANCE_CAMPAIGN_PLAYER);
   
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
   -- local allegiance = target:getAllegiance();
   -- local ALLEGIANCE_PLAYER = 1;
   -- target:setFlag(ALLEGIANCE_PLAYER);
end;