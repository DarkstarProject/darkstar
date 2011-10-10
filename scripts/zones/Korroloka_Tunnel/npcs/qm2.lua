-----------------------------------
--	Area: Korroloka Tunnel
--	NPC:  ???
--	Involved In Quest: Ayame and Kaede
-----------------------------------

require("scripts/globals/keyItems");
require("scripts/globals/settings");
require("scripts/globals/quests");
package.loaded["scripts/zones/Korroloka_Tunnel/TextIDs"] = nil;
require("scripts/zones/Korroloka_Tunnel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == 1) then
		if (player:getVar("AyameAndKaede_Event") == 2 and player:hasKeyItem(STRANGELY_SHAPED_CORAL) == false) then
			leechesDespawned = (GetMobAction(KORROLOKA_LEECH_1) == 0 and GetMobAction(KORROLOKA_LEECH_2) == 0 and GetMobAction(KORROLOKA_LEECH_3) == 0);
			spawnTime = player:getVar("KorrolokaLeeches_Spawned");
			canSpawn = (leechesDespawned and (os.time() - spawnTime) > 30);
			killedLeeches = player:getVar("KorrolokaLeeches");

			if (killedLeeches >= 1) then
				if ((killedLeeches == 3 and (os.time() - player:getVar("KorrolokaLeeches_Timer") < 30)) or (killedLeeches < 3 and leechesDespawned and (os.time() - spawnTime) < 30)) then
					player:addKeyItem(STRANGELY_SHAPED_CORAL);
					player:messageSpecial(KEYITEM_OBTAINED,STRANGELY_SHAPED_CORAL);
					player:setVar("KorrolokaLeeches",0);
					player:setVar("KorrolokaLeeches_Spawned",0);
					player:setVar("KorrolokaLeeches_Timer",0);
				elseif (leechesDespawned) then
					SpawnMob(KORROLOKA_LEECH_1,168); -- Despawn after 3 minutes (-12 seconds for despawn delay).
					SpawnMob(KORROLOKA_LEECH_2,168);
					SpawnMob(KORROLOKA_LEECH_3,168);
					player:setVar("KorrolokaLeeches",0);
					player:setVar("KorrolokaLeeches_Spawned",os.time()+180);
				else
					player:messageSpecial(6392);
				end
			elseif (canSpawn) then
				SpawnMob(KORROLOKA_LEECH_1,168); -- Despawn after 3 minutes (-12 seconds for despawn delay).
				SpawnMob(KORROLOKA_LEECH_2,168);
				SpawnMob(KORROLOKA_LEECH_3,168);
				player:setVar("KorrolokaLeeches_Spawned",os.time()+180);
			else
				player:messageSpecial(NOTHING_FOUND);
			end
		else
			player:messageSpecial(NOTHING_FOUND);
		end
	else
		player:messageSpecial(NOTHING_FOUND);
	end
end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

end;
