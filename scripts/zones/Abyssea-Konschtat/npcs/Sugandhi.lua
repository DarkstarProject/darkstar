----------------------------------------------------------------------------------
-- Sugandhi
-- @pos -648 6 181 15
-- Merchant npc Abyssea-Konschtat    Event(0x0124);
----------------------------------------------------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
--require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

-- Requires a Conquest rank check  script
--
--
function onTrigger(player,npc)

player:showText(npc,PAUNELIE_SHOP_DIALOG,513);

stock =
{
	16748,25859,  -- Kukri +1
	16634,58729,  -- Broadsword +1
	16617,37693,  -- Tuck +1
	16615,143744, -- Falchion +1            140-200k
	16614,7386,   -- Knife +1            6-8k
	16635,87422, -- Mythril Sword +1  80-90k
	16625,17936, -- Scimitar +1       16-18k
	16491,2368, -- Bronze Knife +1     1-2k
	17476,2649, -- Cat Baghnakhs +1    1-2k
	16623,4200, -- Bronze Sword +1     3-5k
	16626,2738, -- Iron Sword +1     24-30k
	16633,2972, -- Degen +1          28-30k
	16801,4766, -- Sapara +1           3-5k


}
showShop(player, STATIC, stock);
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
