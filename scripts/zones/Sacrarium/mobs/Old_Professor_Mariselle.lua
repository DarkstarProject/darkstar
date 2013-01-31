-----------------------------------
-- Area: sacrarium
-- NPC:  old professor Mariselle
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
 if (killer:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and killer:getVar("PromathiaStatus") == 3 and  killer:hasKeyItem(RELIQUIARIUM_KEY)==false)then
	-- print("mobdeath");
	killer:setVar("PromathiaStatus",4);
  end
end;