-----------------------------------
-- Area: Throne Room
-- NPC:  Zeid
-- Mission 9-2 BASTOK BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("/scripts/globals/monstertpmoves");
require("scripts/zones/Throne_Room/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

-----------------------------------
-- onMobEngaged
-----------------------------------

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob, target)
printf("mobtp %u",mob:getTP());

end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob,killer)
killer:startEvent(0x7d04,3,3,1,3,3,3,3,3);
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("finishCSID: %u",csid);
printf("RESULT: %u",option);
if(csid == 0x7d04)then
 if(player:getVar("bcnm_instanceid") == 1)then
	SpawnMob(17453064);
	local volker = player:getBattlefield():insertAlly(14182)
	volker:setSpawn(-450,-167,-239,125);
	volker:spawn();
	player:setPos(-443,-167,-239,127);
 elseif(player:getVar("bcnm_instanceid") == 2)then
	SpawnMob(17453068);
	local volker = player:getBattlefield():insertAlly(14182)
	volker:setSpawn(-450,-167,-239,125);
	volker:spawn();
 elseif(player:getVar("bcnm_instanceid") == 3)then
	SpawnMob(17453072);
	local volker = player:getBattlefield():insertAlly(14182)
	volker:setSpawn(-450,-167,-239,125);
	volker:spawn();
 end
end
end;


