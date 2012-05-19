-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  Archlich Taber'quoan
-- Mission 5-1 BCNM Fight
-----------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Balgas_Dais/TextIDs");
require("scripts/globals/effects/battlefield");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	-- Despawn Warriors from this specific BCNM
	self = mob:getID();

	for i = self+1, self+6, 1 do
		DespawnMob(i);
	end

	
	-- Record management
	record = GetServerVariable("[BF]Mission_5-1_QuBia_Arena_record");
	partyMembers = 1;
	killer:setTitle(ARCHMAGE_ASSASSIN);
	
	newtimer = os.time() - killer:getVar("BCNM_Timer");
		
	if(newtimer < record) then
		SetServerVariable("[BF]Mission_5-1_QuBia_Arena_record",newtimer);
	end

	if(killer:hasKeyItem(NEW_FEIYIN_SEAL) == true) then
		killer:startEvent(0x7d01,0,record,0,newtimer,partyMembers,0,0);
	else
		killer:delStatusEffect(EFFECT_BATTLEFIELD);
	end

end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

	-- Select the mobs from this specific BCNM
	self = mob:getID()
	Sorc_1 = self+1;
	Sorc_2 = self+2;

	-- Spawn and link Warriors when Archlich is attacked
	GetMobByID(Sorc_1):updateEnmity(target)
	GetMobByID(Sorc_2):updateEnmity(target)
	
	for i = self+3, self+6, 1 do
		SpawnMob(i):updateEnmity(target);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("onUpdate CSID: %u",csid);
printf("onUpdate RESULT: %u",option);
	if (csid == 0x7d01) then
		player:delStatusEffect(EFFECT_BATTLEFIELD);
	end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
printf("onFinish RESULT: %u",option);

	pZone = player:getZone();
	if(csid == 0x7d01) then
		if(player:hasKeyItem(NEW_FEIYIN_SEAL) == true ) then
			player:addKeyItem(BURNT_SEAL);
			player:messageSpecial(KEYITEM_OBTAINED,BURNT_SEAL);
			player:setVar("MissionStatus",12);
			player:delKeyItem(NEW_FEIYIN_SEAL);
			SetServerVariable("[BF]Mission_5-1_Enter",0);
		end
		player:levelRestriction(0);
	end
	
end;
