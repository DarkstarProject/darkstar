-----------------------------------
-- Area: Sacrarium
-- NPC:  Keremet
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)

	local Keremet = mob:getID();

-- Send spawned skeleton "pets" to Keremet's target

	for i = Keremet+1, Keremet+12 do
		if (GetMobAction(i) == 16) then
			GetMobByID(i):updateEnmity(target);
		end
	end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	if (killer:getCurrentMission(COP) == THE_SECRETS_OF_WORSHIP and killer:getVar("PromathiaStatus") == 3 and  killer:hasKeyItem(RELIQUIARIUM_KEY)==false) then
		killer:setVar("PromathiaStatus",4);
	end
end;