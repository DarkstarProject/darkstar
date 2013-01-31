-----------------------------------
-- Area: sacrarium
-- NPC:  Keremet
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	GetMobByID(16892050):updateEnmity(target); -- Commence the sack party.
	GetMobByID(16892051):updateEnmity(target);
	GetMobByID(16892052):updateEnmity(target);
	GetMobByID(16892053):updateEnmity(target);
	GetMobByID(16892054):updateEnmity(target);
	GetMobByID(16892055):updateEnmity(target);
	GetMobByID(16892056):updateEnmity(target);
	GetMobByID(16892057):updateEnmity(target);
	GetMobByID(16892058):updateEnmity(target);
	GetMobByID(16892059):updateEnmity(target);
	GetMobByID(16892060):updateEnmity(target);
	GetMobByID(16892061):updateEnmity(target);
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