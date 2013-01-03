-----------------------------------
-- Area: Throne Room
-- NPC:  Shadow Lord
-- Mission 5-2 BCNM Fight
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobFight(mob,target)
	
	-- 1st form
	-- 100% -> 50% immune to magic
	-- after change magic or physical immunity every 5min or 1k dmg
	-- 2nd form
	-- the Shadow Lord will do nothing but his Implosion attack. This attack hits everyone in the battlefield, but he only has 4000 HP
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	killer:startEvent(0x7d04);
	killer:setVar("mobid",mob:getID());
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("updateCSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("finishCSID: %u",csid);
--printf("RESULT: %u",option);
	
	local mobid = player:getVar("mobid");
	DespawnMob(mobid);
	player:setVar("mobid",0);
	
	if(mobid == 17453057) then
		player:setPos(-441.596,-167.000,-240.182,122);
		GetMobByID(mobid+3):setPos(-461.975,-167.7, -239.981, 59);
	elseif(mobid == 17453058) then
		player:setPos(-759.148,-407.100,-479.957,128);
		GetMobByID(mobid+3):setPos(-781.000,-407.000,-477.000,59);
	else
		player:setPos(-1079.065,-647.100,-720.023,128);
		GetMobByID(mobid+3):setPos(-1101.000,-647.000,-716.000,59);
	end
	
end;