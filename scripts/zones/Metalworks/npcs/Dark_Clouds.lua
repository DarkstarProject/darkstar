-----------------------------------
-- Area: Metalworks
-- NPC:  Dark Clouds
-- Type: Augment NPC
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Metalworks/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/spoofchat");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	-- local ITEM = trade:getid();
	-- if (trade:hasItemQty(ITEM,1)) and (trade:getItemCount() == 1) then
		-- player:SpoofChatPlayer( "Wow who sold you this piece of cra... err fine item.", MESSAGE_SAY, npc:getID() );
		-- player:SpoofChatPlayer( "Anyway... I'll need a donation, the higher the donation the better the work I'll do.", MESSAGE_SAY, npc:getID() );
		-- player:SpoofChatPlayer( "Lets start at say, hmm.. 1,000 Gil for the first tier 10,000 for the second tier and finally 25,000 for my special service.", MESSAGE_SAY, npc:getID() );
		-- player:SpoofChatPlayer( "Trade me the item along with your donation and I'll get to work.", MESSAGE_SAY, npc:getID() );
	-- end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- player:SpoofChatPlayer( "Grumbles to himself.", MESSAGE_ECHO, npc:getID() );
	-- player:SpoofChatPlayer( "Oh Hey there, so the boss told me to help you guy's out.", MESSAGE_SAY, npc:getID() );
	-- player:SpoofChatPlayer( "He told me that I have to make our adventures happy, pshhh.", MESSAGE_SAY, npc:getID() );
	-- player:SpoofChatPlayer( "Anyway trade me an item of armour or a weapon and I'll see if I can improve it for you.", MESSAGE_SAY, npc:getID() );
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
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;