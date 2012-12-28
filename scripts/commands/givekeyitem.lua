-----------------------------------
--	[Command name]: give key item to player
--	[Author      ]: link
--	[Description ]: will give key item to player
--
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,keyID)

	pc = GetPlayerByName(target);

	pc:addKeyItem(keyID);
	pc:messageSpecial(KEYITEM_OBTAINED,keyID);

end;