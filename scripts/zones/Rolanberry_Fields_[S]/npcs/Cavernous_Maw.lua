-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: Cavernous Maw
-- @pos -198 8 360 91
-- Teleports Players to Rolanberry Fields
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Rolanberry_Fields_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (hasMawActivated(player,1) == false) then
        player:startEvent(0x0065);
    else
		if (player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and
		(player:getQuestStatus(CRYSTAL_WAR, CLAWS_OF_THE_GRIFFON) == QUEST_COMPLETED or
		 player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_COMPLETED or
		 player:getQuestStatus(CRYSTAL_WAR, FIRES_OF_DISCONTENT) == QUEST_COMPLETED)) then

			player:startEvent(0x02BD);

		else
			player:startEvent(0x0066);
		end

    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID:",csid);
    -- printf("RESULT:",option);
	if (csid == 0x02BD) then
		player:completeMission(WOTG, BACK_TO_THE_BEGINNING);
		player:addMission(WOTG, CAIT_SITH);
		player:setPos(-204,7,365,13,91);
    elseif (option == 1) then
        if (csid == 0x0065) then
            player:addNationTeleport(MAW,2);
        end
        toMaw(player,4);
    end
end;