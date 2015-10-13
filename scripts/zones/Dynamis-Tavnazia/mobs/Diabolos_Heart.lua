-----------------------------------
-- Area:
-- NPC:  Diabolos_Heart
-----------------------------------
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
     	if (killer:hasKeyItem(DYNAMIS_TAVNAZIA_SLIVER ) == false) then
	    	killer:addKeyItem(DYNAMIS_TAVNAZIA_SLIVER);
		    killer:messageSpecial(KEYITEM_OBTAINED,DYNAMIS_TAVNAZIA_SLIVER);
		end
	killer:addTitle(NIGHTMARE_AWAKENER);
end;