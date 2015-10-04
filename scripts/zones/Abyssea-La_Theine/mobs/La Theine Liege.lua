-----------------------------------
-- Zone: Abyssea-La Theine
--  NPC: ??? (qm)
-- Spawns Baba Yaga  (F-7)
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	if(killer:hasKeyItem(SHIMMERING_PIXIE_PINION) == false) then
		killer:addKeyItem(SHIMMERING_PIXIE_PINION);
		
	end

end;