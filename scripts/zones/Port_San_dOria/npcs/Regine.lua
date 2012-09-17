-----------------------------------
--	Area: Port San d'Oria
--	NPC:  Regine
--	Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
count = trade:getItemCount();
MagicFlyer  = trade:hasItemQty(532,1);
MagicParcel = trade:hasItemQty(0x0251,1);

	if (MagicFlyer == true and count == 1) then
		FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
		if (FlyerForRegine == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	elseif (MagicParcel == true and count == 1) then
		TheBrugaireConsortium = player:getQuestStatus(SANDORIA,THE_BRUGAIRE_CONSORTIUM);
		if (TheBrugaireConsortium == 1) then
			player:tradeComplete();
			player:startEvent(0x0217);
			player:setVar("TheBrugaireConsortium-Parcels", 11);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
		player:startEvent(0x1fe);
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

	if (csid == 0x1fe) then
		if (option == 0) then
			stock = {0x1221,1165,1, --Scroll of Diaga
					 0x1238,837,1,  --Scroll of Slow
					 0x1236,7025,1, --Scroll of Stoneskin

					 0x121c,140,2,  --Scroll of Banish
					 0x1226,1165,2, --Scroll of Banishga
					 0x1235,2097,2, --Scroll of Blink
					 0x1202,585,2,  --Scroll of Cure II

					 0x1237,360,3,  --Scroll of Aquaveil
					 0x1210,990,3,  --Scroll of Blindna
					 0x1207,1363,3, --Scroll of Curaga
					 0x1201,61,3,   --Scroll of Cure
					 0x1217,82,3,   --Scroll of Dia
					 0x120f,324,3,  --Scroll of Paralyna
					 0x120e,180,3,  --Scroll of Poisona
					 0x122b,219,3,  --Scroll of Protect
					 0x1230,1584,3} --Scroll of Shell

			showNationShop(player, SANDORIA, stock);
		elseif (option == 1) then
			stock = {0x12fe,111,1,  --Scroll of Blind

					 0x12e6,360,2,  --Scroll of Bio
					 0x12dc,82,2,   --Scroll of Poison
					 0x12fd,2250,2, --Scroll of Sleep

					 0x129a,324,3,  --Scroll of Aero
					 0x1295,1584,3, --Scroll of Blizzard
					 0x12eb,4644,3, --Scroll of Burn
					 0x12ed,2250,3, --Scroll of Choke
					 0x12f0,6366,3, --Scroll of Drown
					 0x1290,837,3,  --Scroll of Fire
					 0x12ec,3688,3, --Scroll of Frost
					 0x12ee,1827,3, --Scroll of Rasp
					 0x12ef,1363,3, --Scroll of Shock
					 0x129f,61,3,   --Scroll of Stone
					 0x12a4,3261,3, --Scroll of Thunder
					 0x12a9,140,3}  --Scroll of Water

			showNationShop(player, SANDORIA, stock);
		end
	end

end;




