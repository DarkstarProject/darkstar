-----------------------------------
--  Area: Selbina
--  NPC: Abelard
--  An Explorer's Footsteps
--  @pos -52 -11 -13 248
--  This quest was changed to require a minimum amount of fame to combat RMTs POS-Hacking around to
--  quickly earn gil. However, as this is not a legitimate concern on private servers players may
--  complete this quest even with no fame.
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");

ZoneID = 
{
	0x00001,800,   -- West Ronfaure
	0x00002,800,   -- East Ronfaure
	0x00004,1000,  -- La Theine Plateau
	0x00008,1000,  -- Valkurm Dunes
	0x00010,1000,  -- Jugner Forest
	0x00020,3000,  -- North Gustaberg
	0x00040,800,   -- South Gustaberg
	0x00080,1000,  -- Konschtat Highlands
	0x00100,1000,  -- Pashhow Marshlands
	0x00200,3000,  -- Rolanberry Fields
	0x00400,800,   -- West Sarutabaruta
	0x00800,800,   -- East Sarutabaruta
	0x01000,1000,  -- Tahrongi Canyon
	0x02000,1000,  -- Buburimu Peninsula
	0x04000,1000,  -- Meriphataud Mountains
	0x08000,10000, -- Sauromugue Champaign
	0x10000,10000  -- Batallia Downs
};

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

    local explorer = player:getQuestStatus(OTHER_AREAS,EN_EXPLORER_S_FOOTSTEPS);
-- AN EXPLORERS FOOTSTEPS QUEST --
    if (explorer == QUEST_ACCEPTED) then
        local clay = trade:hasItemQty(570,1);
        local count = trade:getItemCount();
        if (count == 1 and clay) then
            local tablets = player:getVar("anExplorer-ClayTablets");
            local currtab = player:getVar("anExplorer-CurrentTablet");
            if (currtab ~= 0 and (tablets % (2*currtab)) < currtab) then -- new tablet
                for zone = 1, #ZoneID, 2 do
                    if (tablets % (2*ZoneID[zone]) < ZoneID[zone]) then
                        if ((tablets + currtab) == 0x1ffff) then
                            player:startEvent(0x002f);  -- end
                            break;
                        end
                        if (ZoneID[zone] == currtab) then
                            player:startEvent(0x0029);  -- the tablet he asked for
                        else
                            player:startEvent(0x002e);  -- not the one he asked for
                        end
							player:setVar("anExplorer-ClayTablets", tablets + currtab);
                        break;
                    end
                end
            end
        end
    end
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
local explorer = player:getQuestStatus(OTHER_AREAS,EN_EXPLORER_S_FOOTSTEPS);
local keyitem = player:hasKeyItem(TORN_OUT_PAGES);
local blood = player:getQuestStatus(SANDORIA,SIGNED_IN_BLOOD);
local SignedBldProg = player:getVar("SIGNED_IN_BLOOD_Prog");
-- SIGNED IN BLOOD QUEST -- (WILL ONLY ACTIVATE IF EXPLORERS
-- FOOTSTEPS IS NOT ACTIVE OR IF IT IS COMPLETED)	
if (blood == QUEST_ACCEPTED and keyitem == true and explorer ~= QUEST_ACCEPTED and SignedBldProg == 2) then
	player:startEvent(0x0452);
elseif (blood == QUEST_ACCEPTED and SignedBldProg == 1 and explorer ~= QUEST_ACCEPTED) then
	player:startEvent(0x0450);
elseif (blood == QUEST_ACCEPTED and SignedBldProg == 2 and explorer ~= QUEST_ACCEPTED) then
	player:startEvent(0x0451);
elseif (blood == QUEST_ACCEPTED and SignedBldProg == 3) then
	player:startEvent(0x0030); -- after quest

			

-- AN EXPLORERS FOOTSTEP QUEST --
elseif (explorer == QUEST_AVAILABLE and math.floor((player:getFameLevel(SANDORIA) + player:getFameLevel(BASTOK)) / 2) >= 1) then
	player:startEvent(0x0028);
elseif (explorer == QUEST_ACCEPTED) then
	local tab = player:hasItem(570);
	local clay = player:hasItem(571);
	if (clay == false and tab == false) then
		local currtab = player:getVar("anExplorer-CurrentTablet");
		if (currtab == -1) then
			player:startEvent(0x002a);	
		else
			player:startEvent(0x002c);
			player:setVar("anExplorer-CurrentTablet",0);
		end
	else
		local tablets = player:getVar("anExplorer-ClayTablets");
		for zone = 1, #ZoneID, 2 do
			if (tablets % (2*ZoneID[zone]) < ZoneID[zone]) then 
				if (zone < 20) then
					player:startEvent(0x002b,math.floor(zone/2));
				else 
					player:startEvent(0x0031,math.floor(zone/2)-10);
				end
				break; 
			end
		end
	end
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
	
	if (csid == 0x0452) then 
		player:setVar("SIGNED_IN_BLOOD_Prog",3);

	elseif (csid == 0x0028 and option ~= 0)	then
		if (player:getFreeSlotsCount() > 0) then
			player:addQuest(OTHER_AREAS,EN_EXPLORER_S_FOOTSTEPS);
			player:addItem(571);
			player:messageSpecial(ITEM_OBTAINED,571);
			player:setVar("anExplorer-ClayTablets",0);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,571);
		end
	elseif (csid == 0x002a and option == 100) then	
		if (player:getFreeSlotsCount() > 0) then
			player:addItem(571);
			player:messageSpecial(ITEM_OBTAINED,571);
			player:setVar("anExplorer-CurrentTablet",0);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,571);
		end
	elseif (csid == 0x002c) then
		if (player:getFreeSlotsCount() > 0) then
			player:addItem(571);
			player:messageSpecial(ITEM_OBTAINED,571);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,571);
		end
	elseif (csid == 0x0029 or csid == 0x002e or csid == 0x002f) then 
		local currtab = player:getVar("anExplorer-CurrentTablet");
		local tablets = player:getVar("anExplorer-ClayTablets");
		local keyitem = player:hasKeyItem(MAP_OF_THE_CRAWLERS_NEST);
		for zone = 1, #ZoneID, 2 do
			if (ZoneID[zone] == currtab) then
				player:tradeComplete();
				player:addGil(GIL_RATE*ZoneID[zone+1]);
				player:messageSpecial(GIL_OBTAINED,GIL_RATE*ZoneID[zone+1]);
				player:setVar("anExplorer-CurrentTablet",0);
				break;
			end
		end
		if (csid == 0x002f) then
			player:completeQuest(OTHER_AREAS,EN_EXPLORER_S_FOOTSTEPS);
			player:setVar("anExplorer-ClayTablets",0);
		end
		if (option == 100) then
			player:addItem(571);
			player:messageSpecial(ITEM_OBTAINED,571);
		end
		if (option == 110) then
			player:setVar("anExplorer-CurrentTablet",-1);
		end
		if ((tablets % (2*0x7fff)) >= 0x7fff and keyitem == false) then
			player:addKeyItem(MAP_OF_THE_CRAWLERS_NEST);
			player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_THE_CRAWLERS_NEST);
		end
	elseif (csid == 0x0450) then
		player:setVar("SIGNED_IN_BLOOD_Prog",2);
	end
end;